import 'package:flutter/material.dart';
import '../models/user_progress.dart';
import '../models/category.dart';
import '../models/roadmap_step.dart';
import '../data/gesture_database.dart';
import '../data/roadmap_database.dart';
import '../widgets/common/ad_bottom_bar.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/section_header.dart';
import '../core/constants/app_colors.dart';
import '../core/services/feedback_service.dart';
import '../state/progress_provider.dart';
import '../widgets/illustrations/competence_radar_painter.dart';
import 'gesture_detail_screen.dart';

class ProgressScreen extends StatefulWidget {
  final int initialTabIndex;
  const ProgressScreen({super.key, this.initialTabIndex = 0});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  late int _selectedTab;
  late UserProgress _progress;
  late List<String> _bookmarks;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTabIndex;
    _progress = ProgressProvider().progress;
    _bookmarks = ProgressProvider().bookmarks;
    ProgressProvider().addListener(_onProgressChanged);
  }

  @override
  void dispose() {
    ProgressProvider().removeListener(_onProgressChanged);
    super.dispose();
  }

  void _onProgressChanged() {
    if (!mounted) return;
    setState(() {
      _progress = ProgressProvider().progress;
      _bookmarks = ProgressProvider().bookmarks;
    });
  }

  void _loadData() {
    ProgressProvider().loadProgress();
  }

  Map<String, double> _calculateCategoryScores() {
    final explored = _progress.exploredGestureIds;
    final totalQuizzes = _progress.totalQuizzesTaken;
    final accuracy = _progress.averageQuizAccuracy / 100.0;

    double calcScore(CategoryType cat) {
      final totalInCat = GestureDatabase.getByCategory(cat).length;
      if (totalInCat == 0) return 0.2;
      final exploredInCat = GestureDatabase.getByCategory(cat)
          .where((g) => explored.contains(g.id))
          .length;
      final exploreRatio = exploredInCat / totalInCat;
      final quizBonus = totalQuizzes > 0 ? (accuracy * 0.4) : 0.1;
      return (exploreRatio * 0.6 + quizBonus).clamp(0.15, 1.0);
    }

    return {
      'Rostro': calcScore(CategoryType.expresionesFaciales),
      'Voz': calcScore(CategoryType.factoresParalinguisticos),
      'Cuerpo': calcScore(CategoryType.lenguajeCorporal),
      'Espacio': calcScore(CategoryType.proxemica),
      'Entorno': calcScore(CategoryType.entornoApariencia),
      'Digital': calcScore(CategoryType.comunicacionDigital),
    };
  }

  String _getRankTitle(int points) {
    if (points >= 500) return 'Maestro Decodificador';
    if (points >= 300) return 'Analista Experto';
    if (points >= 150) return 'Observador Atento';
    return 'Iniciado en Comunicación';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final totalGestures = GestureDatabase.items.length;
    final exploredCount = _progress.exploredGestureIds.length;
    final exploredRatio = totalGestures > 0
        ? (exploredCount / totalGestures).clamp(0.0, 1.0)
        : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Progreso y Maestría'),
      ),
      bottomNavigationBar: const AdBottomBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              // Selector de Vista: Ruta vs Métricas
              _buildTabSelector(isDark),
              const SizedBox(height: 16),

              if (_selectedTab == 0)
                ..._buildRoadmapWidgets(isDark)
              else
                ..._buildMetricsWidgets(
                    isDark, totalGestures, exploredCount, exploredRatio),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabSelector(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTabButton(
              index: 0,
              icon: Icons.alt_route_rounded,
              label: 'Ruta "How to Human"',
              isDark: isDark,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: _buildTabButton(
              index: 1,
              icon: Icons.insights_rounded,
              label: 'Métricas y Radar',
              isDark: isDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required int index,
    required IconData icon,
    required String label,
    required bool isDark,
  }) {
    final isSelected = _selectedTab == index;
    return InkWell(
      onTap: () {
        FeedbackService.lightClick();
        setState(() => _selectedTab = index);
      },
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? AppColors.primary : Colors.white)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 17,
              color: isSelected
                  ? (isDark ? Colors.white : AppColors.primary)
                  : (isDark
                      ? AppColors.textMutedDark
                      : AppColors.textMutedLight),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                  color: isSelected
                      ? (isDark ? Colors.white : AppColors.primaryDark)
                      : (isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRoadmapWidgets(bool isDark) {
    bool isPreviousStepCompleted = true;
    final widgets = <Widget>[];

    // Banner de Presentación
    widgets.add(
      AppCard(
        padding: const EdgeInsets.all(16),
        color: isDark ? const Color(0xFF134E4A) : AppColors.primaryContainer,
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.school_rounded,
                      color: Colors.white, size: 22),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Currículum: How to Human',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: isDark ? Colors.white : AppColors.primaryDark,
                        ),
                      ),
                      Text(
                        'Itinerario neuroafirmativo paso a paso para personas TEA',
                        style: TextStyle(
                          fontSize: 11.5,
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Avanza en orden secuencial: desde cómo observar sin sobrecarga (Línea Base) hasta el descifrado de indirectas, límites asertivos y negociación en el mundo real.',
              style: TextStyle(
                fontSize: 12,
                height: 1.35,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
          ],
        ),
      ),
    );
    widgets.add(const SizedBox(height: 16));

    // Recorrido de los 5 niveles
    for (final level in RoadmapDatabase.levels) {
      final completedInLevel = level.completedStepsCount(_progress);
      final isLevelDone = level.isLevelCompleted(_progress);

      widgets.add(
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabecera del Nivel
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.primary.withValues(alpha: 0.25)
                          : AppColors.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      level.icon,
                      size: 20,
                      color:
                          isDark ? AppColors.primaryLight : AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          level.title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          level.objective,
                          style: TextStyle(
                            fontSize: 11.5,
                            color: isDark
                                ? AppColors.textMutedDark
                                : AppColors.textMutedLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isLevelDone
                          ? (isDark
                              ? const Color(0xFF064E3B)
                              : const Color(0xFFDCFCE7))
                          : (isDark
                              ? const Color(0xFF1E293B)
                              : const Color(0xFFF1F5F9)),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isLevelDone
                            ? AppColors.success
                            : (isDark
                                ? AppColors.darkBorder
                                : AppColors.lightBorder),
                        width: 0.8,
                      ),
                    ),
                    child: Text(
                      '$completedInLevel/${level.steps.length}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: isLevelDone
                            ? AppColors.success
                            : (isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Lista de Pasos con Línea Conectora
              ...level.steps.asMap().entries.map((entry) {
                final idx = entry.key;
                final step = entry.value;
                final status =
                    step.getStatus(_progress, isPreviousStepCompleted);
                final isLastStepInLevel = idx == level.steps.length - 1;

                if (status == RoadmapStepStatus.completed) {
                  isPreviousStepCompleted = true;
                } else {
                  isPreviousStepCompleted = false;
                }

                return _buildStepTimelineTile(
                  step: step,
                  status: status,
                  isLast: isLastStepInLevel,
                  isDark: isDark,
                );
              }),
            ],
          ),
        ),
      );
      widgets.add(const SizedBox(height: 14));
    }

    return widgets;
  }

  Widget _buildStepTimelineTile({
    required RoadmapStep step,
    required RoadmapStepStatus status,
    required bool isLast,
    required bool isDark,
  }) {
    Color nodeColor;
    Color nodeBorderColor;
    IconData nodeIcon;
    Color nodeIconColor;
    String statusLabel;
    Color statusBgColor;
    Color statusTextColor;

    switch (status) {
      case RoadmapStepStatus.completed:
        nodeColor =
            isDark ? const Color(0xFF064E3B) : const Color(0xFFDCFCE7);
        nodeBorderColor = AppColors.success;
        nodeIcon = Icons.check_rounded;
        nodeIconColor = AppColors.success;
        statusLabel = 'Completado';
        statusBgColor =
            isDark ? const Color(0xFF064E3B) : const Color(0xFFDCFCE7);
        statusTextColor =
            isDark ? const Color(0xFF86EFAC) : const Color(0xFF166534);
        break;
      case RoadmapStepStatus.current:
        nodeColor =
            isDark ? const Color(0xFF134E4A) : AppColors.primaryContainer;
        nodeBorderColor = AppColors.primary;
        nodeIcon = step.icon;
        nodeIconColor = isDark ? AppColors.accentLight : AppColors.primary;
        statusLabel = 'Misión Actual';
        statusBgColor =
            isDark ? const Color(0xFF134E4A) : const Color(0xFFCCFBF1);
        statusTextColor =
            isDark ? const Color(0xFF5EEAD4) : const Color(0xFF0F766E);
        break;
      case RoadmapStepStatus.locked:
        nodeColor =
            isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9);
        nodeBorderColor =
            isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1);
        nodeIcon = Icons.lock_outline_rounded;
        nodeIconColor =
            isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8);
        statusLabel = 'Pendiente';
        statusBgColor =
            isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9);
        statusTextColor =
            isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8);
        break;
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Columna de Timeline con Nodo y Línea
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: nodeColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: nodeBorderColor, width: 2),
                  ),
                  child: Center(
                    child: Icon(nodeIcon, size: 14, color: nodeIconColor),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: status == RoadmapStepStatus.completed
                          ? AppColors.success.withValues(alpha: 0.5)
                          : (isDark
                              ? const Color(0xFF334155)
                              : const Color(0xFFE2E8F0)),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 10),

          // Tarjeta de Contenido del Paso
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  if (status == RoadmapStepStatus.locked) {
                    FeedbackService.lightClick();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Completa los pasos anteriores para desbloquear esta estación.',
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    FeedbackService.lightClick();
                    RoadmapDatabase.navigateToDestination(
                        context, step.destination);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: status == RoadmapStepStatus.current
                        ? (isDark
                            ? AppColors.primary.withValues(alpha: 0.12)
                            : AppColors.primaryContainer.withValues(alpha: 0.3))
                        : (isDark
                            ? const Color(0xFF0F172A)
                            : const Color(0xFFF8FAFC)),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: status == RoadmapStepStatus.current
                          ? AppColors.primary
                          : (isDark
                              ? AppColors.darkBorder
                              : AppColors.lightBorder),
                      width: status == RoadmapStepStatus.current ? 1.5 : 0.8,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'PASO ${step.stepNumber}',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                              color: isDark
                                  ? AppColors.textMutedDark
                                  : AppColors.textMutedLight,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: statusBgColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              statusLabel,
                              style: TextStyle(
                                fontSize: 9.5,
                                fontWeight: FontWeight.w800,
                                color: statusTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        step.title,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w800,
                          color: status == RoadmapStepStatus.locked
                              ? (isDark
                                  ? AppColors.textMutedDark
                                  : AppColors.textMutedLight)
                              : null,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        step.subtitle,
                        style: TextStyle(
                          fontSize: 11.5,
                          color: isDark
                              ? AppColors.textMutedDark
                              : AppColors.textMutedLight,
                          height: 1.25,
                        ),
                      ),
                      if (status == RoadmapStepStatus.current) ...[
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Material(
                            color: isDark
                                ? AppColors.primaryLight
                                : AppColors.primary,
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                FeedbackService.lightClick();
                                RoadmapDatabase.navigateToDestination(
                                    context, step.destination);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 14,
                                      color:
                                          isDark ? Colors.black : Colors.white,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Abrir Práctica',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: isDark
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMetricsWidgets(
    bool isDark,
    int totalGestures,
    int exploredCount,
    double exploredRatio,
  ) {
    return [
      // Rank Banner
      AppCard(
        color:
            isDark ? const Color(0xFF134E4A) : AppColors.primaryContainer,
        borderSide:
            const BorderSide(color: AppColors.primary, width: 1.5),
        padding: const EdgeInsets.all(18),
        onTap: () {
          FeedbackService.levelUp();
        },
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.military_tech_rounded,
                  color: Colors.white, size: 34),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getRankTitle(_progress.totalPoints),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: isDark ? Colors.white : AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${_progress.totalPoints} pts • ${_progress.motivationalMessage}',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: _progress.masteryRatio == 0.0
                          ? 0.02
                          : _progress.masteryRatio,
                      minHeight: 6,
                      backgroundColor: isDark
                          ? const Color(0xFF334155)
                          : const Color(0xFFE2E8F0),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        isDark ? AppColors.accentLight : AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${_progress.totalMilestonesCompleted} de ${UserProgress.totalPossibleMilestones} hitos completados (${_progress.masteryPercentage}%)',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.accentLight
                          : AppColors.primaryDark,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${_progress.masteryPercentage}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),

      // 3-Stat Grid
      Row(
        children: [
          Expanded(
            child: AppCard(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const Icon(Icons.local_fire_department_rounded,
                      color: AppColors.accent, size: 26),
                  const SizedBox(height: 4),
                  Text(
                    '${_progress.currentStreak} días',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Racha Activa',
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AppCard(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const Icon(Icons.check_circle_rounded,
                      color: AppColors.success, size: 26),
                  const SizedBox(height: 4),
                  Text(
                    '${_progress.averageQuizAccuracy.round()}%',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Precisión Quiz',
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AppCard(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const Icon(Icons.theater_comedy_rounded,
                      color: AppColors.indigo, size: 26),
                  const SizedBox(height: 4),
                  Text(
                    '${_progress.completedScenarioIds.length}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Escenarios',
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),

      // Explored Gestures Bar
      AppCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Señales y Gestos Explorados',
                    style: TextStyle(
                        fontSize: 14.5, fontWeight: FontWeight.w800)),
                Text('$exploredCount de $totalGestures',
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary)),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: exploredRatio,
                minHeight: 8,
                backgroundColor: isDark
                    ? AppColors.darkBorder
                    : AppColors.lightBorder,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),

      // Radar Chart: Radar de Competencias No Verbales
      const SectionHeader(
        title: 'Radar de Competencias No Verbales',
        subtitle:
            'Tu nivel de dominio en las 6 dimensiones de la comunicación',
      ),
      AppCard(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Center(
          child: SizedBox(
            width: 280,
            height: 260,
            child: CustomPaint(
              painter: CompetenceRadarPainter(
                scores: _calculateCategoryScores(),
                isDark: isDark,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 24),

      // Bookmarked Gestures Section
      SectionHeader(
        title: 'Señales Guardadas (${_bookmarks.length})',
        subtitle: 'Tus señales destacadas para repaso',
      ),
      const SizedBox(height: 8),

      if (_bookmarks.isEmpty)
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              'No tienes señales guardadas aún.\nToca el ícono de marcador en cualquier señal para guardarla aquí.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.5,
                  color: isDark
                      ? AppColors.textMutedDark
                      : AppColors.textMutedLight),
            ),
          ),
        )
      else
        for (final bookmarkId in _bookmarks) ...[
          Builder(builder: (context) {
            final item = GestureDatabase.getById(bookmarkId);
            if (item == null) return const SizedBox.shrink();
            final cat = CategoryInfo.getInfo(item.category);

            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: AppCard(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 10),
                onTap: () {
                  FeedbackService.lightClick();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          GestureDetailScreen(gestureId: item.id),
                    ),
                  ).then((_) => _loadData());
                },
                child: Row(
                  children: [
                    Icon(cat.icon, size: 20, color: cat.primaryColor),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item.name,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 20,
                      color: isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight,
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      const SizedBox(height: 24),
    ];
  }
}
