import 'package:flutter/material.dart';
import '../models/scenario.dart';
import '../data/scenario_database.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/badge_pill.dart';
import '../core/constants/app_colors.dart';
import '../core/services/feedback_service.dart';
import '../core/services/storage_service.dart';
import 'scenario_runner_screen.dart';

class ScenariosScreen extends StatefulWidget {
  const ScenariosScreen({super.key});

  @override
  State<ScenariosScreen> createState() => _ScenariosScreenState();
}

class _ScenariosScreenState extends State<ScenariosScreen> {
  List<String> _completedIds = [];
  String _selectedCategory = 'all';

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  void _loadProgress() {
    setState(() {
      _completedIds = StorageService.loadProgress().completedScenarioIds;
    });
  }

  List<Scenario> get _filteredScenarios {
    if (_selectedCategory == 'work_sales') {
      return ScenarioDatabase.scenarios.where((s) =>
          s.domain == 'Ámbito Laboral' || s.domain == 'Ventas & Negociación'
      ).toList();
    } else if (_selectedCategory == 'daily_social') {
      return ScenarioDatabase.scenarios.where((s) =>
          s.domain == 'Vida Diaria' || s.domain == 'Relaciones Sociales'
      ).toList();
    }
    return ScenarioDatabase.scenarios;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final allScenarios = ScenarioDatabase.scenarios;
    final workCount = allScenarios.where((s) =>
        s.domain == 'Ámbito Laboral' || s.domain == 'Ventas & Negociación').length;
    final socialCount = allScenarios.where((s) =>
        s.domain == 'Vida Diaria' || s.domain == 'Relaciones Sociales').length;
    final filtered = _filteredScenarios;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulador de Escenarios'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 640;
          final columns = isTablet ? 2 : 1;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1050),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [
                  // Banner intro
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.theater_comedy_rounded,
                            color: isDark
                                ? AppColors.primaryLight
                                : AppColors.primary,
                            size: 28),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Entrena en situaciones reales de ventas, entrevistas y vida social. Toma decisiones y observa las consecuencias.',
                            style: TextStyle(
                              fontSize: 13,
                              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Filtros temáticos
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ChoiceChip(
                          label: Text('Todos (${allScenarios.length})'),
                          selected: _selectedCategory == 'all',
                          selectedColor: AppColors.primary,
                          labelStyle: TextStyle(
                            color: _selectedCategory == 'all'
                                ? Colors.white
                                : (isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimaryLight),
                            fontWeight: FontWeight.w700,
                          ),
                          onSelected: (_) {
                            FeedbackService.lightClick();
                            setState(() => _selectedCategory = 'all');
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          avatar: const Icon(Icons.business_center_rounded, size: 18),
                          label: Text('Laboral y Ventas ($workCount)'),
                          selected: _selectedCategory == 'work_sales',
                          selectedColor: AppColors.primary,
                          labelStyle: TextStyle(
                            color: _selectedCategory == 'work_sales'
                                ? Colors.white
                                : (isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimaryLight),
                            fontWeight: FontWeight.w700,
                          ),
                          onSelected: (_) {
                            FeedbackService.lightClick();
                            setState(() => _selectedCategory = 'work_sales');
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          avatar: const Icon(Icons.people_alt_rounded, size: 18),
                          label: Text('Vida Diaria y Social ($socialCount)'),
                          selected: _selectedCategory == 'daily_social',
                          selectedColor: AppColors.primary,
                          labelStyle: TextStyle(
                            color: _selectedCategory == 'daily_social'
                                ? Colors.white
                                : (isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimaryLight),
                            fontWeight: FontWeight.w700,
                          ),
                          onSelected: (_) {
                            FeedbackService.lightClick();
                            setState(() => _selectedCategory = 'daily_social');
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  if (isTablet)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        childAspectRatio: 1.65,
                      ),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final scenario = filtered[index];
                        return AppCard(
                          padding: const EdgeInsets.all(16),
                          onTap: () {
                            FeedbackService.lightClick();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ScenarioRunnerScreen(scenario: scenario),
                              ),
                            ).then((_) => _loadProgress());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  BadgePill(
                                    text: scenario.domain,
                                    color: AppColors.indigo,
                                  ),
                                  const Spacer(),
                                  if (_completedIds.contains(scenario.id))
                                    const BadgePill(
                                      text: 'Completado',
                                      icon: Icons.check_circle_rounded,
                                      color: AppColors.success,
                                    ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                scenario.title,
                                style: const TextStyle(
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.2,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Expanded(
                                child: Text(
                                  scenario.description,
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                    height: 1.3,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.format_list_numbered_rounded,
                                      size: 18,
                                      color: isDark
                                          ? AppColors.textMutedDark
                                          : AppColors.textMutedLight),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${scenario.steps.length} momentos de decisión',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: isDark
                                            ? AppColors.textMutedDark
                                            : AppColors.textMutedLight),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Comenzar',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: isDark
                                            ? AppColors.primaryLight
                                            : AppColors.primary),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(Icons.arrow_forward_rounded,
                                      size: 18,
                                      color: isDark
                                          ? AppColors.primaryLight
                                          : AppColors.primary),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  else
                    // Mobile Stack
                    for (final scenario in filtered) ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14.0),
                        child: AppCard(
                          padding: const EdgeInsets.all(16),
                          onTap: () {
                            FeedbackService.lightClick();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ScenarioRunnerScreen(scenario: scenario),
                              ),
                            ).then((_) => _loadProgress());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  BadgePill(
                                    text: scenario.domain,
                                    color: AppColors.indigo,
                                  ),
                                  const Spacer(),
                                  if (_completedIds.contains(scenario.id))
                                    const BadgePill(
                                      text: 'Completado',
                                      icon: Icons.check_circle_rounded,
                                      color: AppColors.success,
                                    ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                scenario.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.2,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                scenario.description,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                  height: 1.3,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(Icons.format_list_numbered_rounded,
                                      size: 18,
                                      color: isDark
                                          ? AppColors.textMutedDark
                                          : AppColors.textMutedLight),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${scenario.steps.length} momentos de decisión',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: isDark
                                            ? AppColors.textMutedDark
                                            : AppColors.textMutedLight),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Comenzar',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: isDark
                                            ? AppColors.primaryLight
                                            : AppColors.primary),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(Icons.arrow_forward_rounded,
                                      size: 18,
                                      color: isDark
                                          ? AppColors.primaryLight
                                          : AppColors.primary),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
