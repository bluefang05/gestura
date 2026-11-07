import '../data/concepts_database.dart';
import 'concepts_screen.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/services/feedback_service.dart';
import '../core/services/storage_service.dart';
import '../core/services/tts_service.dart';
import '../widgets/common/tts_app_bar_control.dart';
import '../data/quiz_database.dart';
import '../state/progress_provider.dart';
import '../models/quiz_question.dart';
import '../widgets/common/ad_bottom_bar.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/badge_pill.dart';
import '../widgets/illustrations/illustration_widget.dart';
import '../widgets/quiz/quiz_feedback_sheet.dart';
import '../core/navigation/app_route_observer.dart';

class FlashQuizScreen extends StatefulWidget {
  const FlashQuizScreen({super.key});

  @override
  State<FlashQuizScreen> createState() => _FlashQuizScreenState();
}

class _FlashQuizScreenState extends State<FlashQuizScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver, RouteAware {
  bool _prepared = false;
  late List<QuizQuestion> _questions;
  late List<QuizOption> _displayedOptions;
  final Random _random = Random();
  int _currentIndex = 0;
  late int _totalQuestions;
  int _firstTryCorrectCount = 0;
  int _attempts = 0;
  final _attemptedIds = <String>{};
  int _correctCount = 0;
  bool _isImageVisible = true;
  bool _isAnswered = false;
  QuizOption? _selectedOption;

  late AnimationController _timerController;
  PageRoute<dynamic>? _route;
  bool _routeVisible = true;
  bool _appActive = true;
  bool _paused = false;
  bool _narrationPending = false;
  final _scrollController = ScrollController();

  static const int flashSeconds = 3;

  @override
  void initState() {
    super.initState();
    final allVisual = QuizDatabase.questions
        .where((q) => q.questionIllustrationKey != null && !q.isImageOptionGrid)
        .toList();
    _questions = allVisual..shuffle();
    if (_questions.length > 8) {
      _questions = _questions.sublist(0, 8);
    }

    _totalQuestions = _questions.length;
    _timerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: flashSeconds),
    );
    _timerController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted && !_isAnswered) {
        setState(() => _isImageVisible = false);
      }
    });
    WidgetsBinding.instance.addObserver(this);
    TtsService.currentSpeakingIdNotifier.addListener(_onSpeechChanged);
  }

  bool get _speechActive =>
      _narrationPending || TtsService.currentSpeakingIdNotifier.value != null;

  void _updateClock() {
    if (!_prepared ||
        !_isImageVisible ||
        _isAnswered ||
        _paused ||
        !_routeVisible ||
        !_appActive ||
        _speechActive) {
      _timerController.stop();
    } else if (!_timerController.isCompleted) {
      _timerController.forward();
    }
  }

  void _onSpeechChanged() {
    if (!mounted) return;
    _updateClock();
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute<dynamic> && route != _route) {
      appRouteObserver.unsubscribe(this);
      _route = route;
      appRouteObserver.subscribe(this, route);
    }
  }

  @override
  void didPushNext() {
    _routeVisible = false;
    _updateClock();
  }

  @override
  void didPopNext() {
    _routeVisible = true;
    _updateClock();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appActive = state == AppLifecycleState.resumed;
    _updateClock();
  }

  Future<void> _readQuestion() async {
    if (!mounted ||
        !_prepared ||
        _questions.isEmpty ||
        _isAnswered ||
        ModalRoute.of(context)?.isCurrent != true) {
      return;
    }
    final question = _questions[_currentIndex];
    setState(() => _narrationPending = true);
    _updateClock();
    try {
      await TtsService.speakQuizQuestion(
        question: question.prompt,
        scenarioText: question.scenarioText,
        options: _displayedOptions.map((option) => option.readingText).toList(),
        tag: 'flash_q_${question.id}',
      );
    } finally {
      if (mounted) {
        setState(() => _narrationPending = false);
        _updateClock();
      }
    }
  }

  void _startQuestionFlash() {
    if (_scrollController.hasClients) _scrollController.jumpTo(0);
    _displayedOptions = shuffledQuizOptions(_questions[_currentIndex], _random);
    setState(() {
      _isImageVisible = true;
      _isAnswered = false;
      _selectedOption = null;
    });

    _timerController.reset();
    _narrationPending = StorageService.getAutoNarration();
    _updateClock();
    FeedbackService.tick();
    if (_narrationPending) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _readQuestion());
    }
  }

  void _submitAnswer(QuizOption option) {
    if (_isAnswered) return;
    _timerController.stop();
    final firstAttempt = _attemptedIds.add(_questions[_currentIndex].id);

    setState(() {
      _isAnswered = true;
      _selectedOption = option;
      _attempts++;
      if (option.isCorrect) {
        if (firstAttempt) _firstTryCorrectCount++;
        _correctCount++;
        FeedbackService.success();
      } else {
        _questions.add(_questions[_currentIndex]);
        FeedbackService.error();
      }
    });

    final currentQ = _questions[_currentIndex];
    ProgressProvider()
        .recordQuizResult(currentQ.id, option.isCorrect ? 100 : 0);

    TtsService.stop();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => QuizFeedbackSheet(
        correctAnswer:
            currentQ.options.firstWhere((o) => o.isCorrect).readingText,
        isCorrect: option.isCorrect,
        keyVisualClue: currentQ.keyVisualClue,
        explanation: currentQ.explanation,
        onContinue: () {
          TtsService.stop();
          Navigator.pop(ctx);
        },
      ),
    ).then((_) {
      if (mounted) _nextQuestion();
    });
  }

  void _nextQuestion() {
    TtsService.stop();
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _startQuestionFlash();
    } else {
      _saveProgressAndFinish();
    }
  }

  void _saveProgressAndFinish() {
    FeedbackService.complete();
    _showSummaryDialog();
  }

  void _showSummaryDialog() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        scrollable: true,
        title: const Text('¡Sesión Completada!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.flash_on_rounded,
                color: isDark ? AppColors.accentLight : AppColors.accent,
                size: 48),
            const SizedBox(height: 12),
            Text('Resueltas: $_correctCount de $_totalQuestions',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            Text(
                'Al primer intento: $_firstTryCorrectCount de $_totalQuestions',
                style: TextStyle(
                    color: isDark ? AppColors.primaryLight : AppColors.primary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Intentos totales: $_attempts'),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('Volver'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    appRouteObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    TtsService.currentSpeakingIdNotifier.removeListener(_onSpeechChanged);
    _timerController.dispose();
    _scrollController.dispose();
    TtsService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Modo Flash')),
        body:
            const Center(child: Text('No hay preguntas visuales disponibles.')),
      );
    }
    if (!_prepared) {
      return ConceptsScreen(
          concepts: ConceptsDatabase.forQuestions(_questions),
          onStart: () {
            setState(() => _prepared = true);
            _startQuestionFlash();
          });
    }
    final currentQ = _questions[_currentIndex];

    // Determine the key illustration to show
    final illustrationToShow = currentQ.questionIllustrationKey!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modo Flash Contrarreloj'),
        actions: [
          IconButton(
              tooltip: 'Consultar conceptos',
              icon: const Icon(Icons.menu_book_outlined),
              onPressed: () {
                TtsService.stop();
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (_) => const ConceptsScreen()));
              }),
          TtsAppBarControl(
            onPlay: _readQuestion,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: AnimatedBuilder(
            animation: _timerController,
            builder: (context, _) {
              return LinearProgressIndicator(
                value: 1.0 - _timerController.value,
                backgroundColor: isDark ? Colors.black38 : Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(
                  _timerController.value > 0.7
                      ? AppColors.error
                      : (isDark ? AppColors.accentLight : AppColors.accent),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const AdBottomBar(),
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          // Header Stats
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              BadgePill(
                text: _currentIndex < _totalQuestions
                    ? 'Pregunta ${_currentIndex + 1} de $_totalQuestions'
                    : 'Repaso · ${_totalQuestions - _correctCount} pendientes',
                color: isDark ? AppColors.primaryLight : AppColors.primary,
              ),
              BadgePill(
                text: '$_correctCount de $_totalQuestions resueltas',
                color: isDark ? AppColors.accentLight : AppColors.accent,
                icon: Icons.bolt_rounded,
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Question Prompt
          Text(
            currentQ.prompt,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 14),

          if (currentQ.scenarioText != null) ...[
            Text(currentQ.scenarioText!),
            const SizedBox(height: 14),
          ],
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  if (!_isImageVisible) {
                    _isImageVisible = true;
                    _paused = false;
                    _timerController.reset();
                  } else {
                    _paused = !_paused;
                  }
                });
                _updateClock();
              },
              icon: Icon(!_isImageVisible
                  ? Icons.replay_rounded
                  : _paused
                      ? Icons.play_arrow_rounded
                      : Icons.pause_rounded),
              label: Text(!_isImageVisible
                  ? 'Ver imagen otra vez'
                  : _paused
                      ? 'Reanudar imagen'
                      : 'Pausar imagen'),
            ),
          ),
          Text(_speechActive
              ? 'Tiempo pausado mientras escuchas.'
              : 'La imagen se oculta tras 3 segundos. Puedes pausar o volver a verla. Responde a tu ritmo.'),
          const SizedBox(height: 12),
          // Flash Image Display Container
          Center(
            child: AppCard(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: 200,
                height: 200,
                child: _isImageVisible
                    ? ConoVeIllustration(
                        illustrationKey: illustrationToShow,
                        width: 200,
                        height: 200,
                        borderRadius: BorderRadius.circular(16),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF1E293B)
                              : const Color(0xFFE2E8F0),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer_off_rounded,
                                size: 48,
                                color: isDark
                                    ? AppColors.accentLight
                                    : AppColors.accent),
                            const SizedBox(height: 8),
                            const Text(
                              '¡Tiempo de visualización agotado!',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Elige la opción correcta por memoria',
                              style: TextStyle(
                                fontSize: 11,
                                color: isDark
                                    ? AppColors.textMutedDark
                                    : AppColors.textMutedLight,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Options Grid / List
          Column(
            children: _displayedOptions.map((option) {
              final isSelected = _selectedOption == option;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AppCard(
                  onTap: _isAnswered ? null : () => _submitAnswer(option),
                  color: isSelected
                      ? (option.isCorrect
                          ? AppColors.success.withValues(alpha: 0.15)
                          : AppColors.error.withValues(alpha: 0.15))
                      : null,
                  borderSide: isSelected
                      ? BorderSide(
                          color: option.isCorrect
                              ? AppColors.success
                              : AppColors.error,
                          width: 2)
                      : null,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              option.text,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 13.5),
                            ),
                            if (option.subtext != null) ...[
                              const SizedBox(height: 2),
                              Text(
                                option.subtext!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDark
                                      ? AppColors.textMutedDark
                                      : AppColors.textMutedLight,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          option.isCorrect
                              ? Icons.check_circle_rounded
                              : Icons.cancel_rounded,
                          color: option.isCorrect
                              ? AppColors.success
                              : AppColors.error,
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
