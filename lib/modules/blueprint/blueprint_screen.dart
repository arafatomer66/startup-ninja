import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../app/routes.dart';
import '../../data/models/kit_model.dart';
import '../../data/models/section_model.dart';
import '../../data/services/blueprint_aggregator.dart';
import '../../data/services/blueprint_pdf.dart';
import '../../widgets/responsive.dart';
import 'widgets/health_card.dart';
import 'widgets/kit_section.dart';
import 'widgets/financial_summary_card.dart';
import 'widgets/pitch_view.dart';
import 'widgets/gap_panel.dart';

class BlueprintScreen extends StatefulWidget {
  const BlueprintScreen({super.key});

  @override
  State<BlueprintScreen> createState() => _BlueprintScreenState();
}

class _BlueprintScreenState extends State<BlueprintScreen> {
  bool _pitchMode = false;

  @override
  Widget build(BuildContext context) {
    final aggregator = Get.find<BlueprintAggregator>();

    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: Obx(() {
        final blueprint = aggregator.build(startupKits);
        return FloatingActionButton.extended(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          icon: const Icon(Icons.picture_as_pdf_rounded),
          label: const Text('Export PDF',
              style: TextStyle(fontWeight: FontWeight.w800)),
          onPressed: () => _exportPdf(blueprint),
        );
      }),
      body: Obx(() {
        final blueprint = aggregator.build(startupKits);
        final isWide = Breakpoints.isDesktop(context);

        return ResponsiveSliverBody(
          wide: true,
          slivers: [
            _buildAppBar(blueprint),
            if (_pitchMode)
              SliverToBoxAdapter(
                child: PitchView(blueprint: blueprint),
              )
            else ...[
              if (isWide)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: HealthCard(health: blueprint.health),
                        ),
                        Expanded(
                          child: FinancialSummaryCard(finance: blueprint.finance),
                        ),
                      ],
                    ),
                  ),
                )
              else ...[
                SliverToBoxAdapter(
                  child: HealthCard(health: blueprint.health),
                ),
                SliverToBoxAdapter(
                  child: FinancialSummaryCard(finance: blueprint.finance),
                ),
              ],
              if (blueprint.gaps.isNotEmpty)
                SliverToBoxAdapter(
                  child: GapPanel(
                    gaps: blueprint.gaps,
                    onTap: _navigateToSectionById,
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              for (final summary in blueprint.kits)
                SliverToBoxAdapter(
                  child: KitSectionView(
                    summary: summary,
                    onTapSection: (s) => _navigateToSection(summary.kit, s),
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ],
        );
      }),
    );
  }

  Future<void> _exportPdf(Blueprint blueprint) async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    try {
      await BlueprintPdf.share(blueprint);
    } catch (e) {
      Get.snackbar(
        'Export failed',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.accent,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      if (Get.isDialogOpen ?? false) Get.back();
    }
  }

  void _navigateToSection(KitModel kit, SectionModel section) {
    Get.toNamed(Routes.section, arguments: {'kit': kit, 'section': section});
  }

  void _navigateToSectionById(String sectionId) {
    for (final k in startupKits) {
      for (final s in k.sections) {
        if (s.id == sectionId) {
          _navigateToSection(k, s);
          return;
        }
      }
    }
  }

  SliverAppBar _buildAppBar(Blueprint blueprint) {
    return SliverAppBar(
      expandedHeight: 168,
      pinned: true,
      backgroundColor: AppColors.primary,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Colors.white, size: 18),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.18),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              _PitchToggle(
                label: 'Detail',
                active: !_pitchMode,
                onTap: () => setState(() => _pitchMode = false),
              ),
              _PitchToggle(
                label: 'Pitch',
                active: _pitchMode,
                onTap: () => setState(() => _pitchMode = true),
              ),
            ],
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(gradient: AppGradients.hero),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 56, 20, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    blueprint.companyName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (blueprint.tagline != null &&
                      blueprint.tagline!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      blueprint.tagline!,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Blueprint · ${blueprint.health.label}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PitchToggle extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _PitchToggle(
      {required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: active ? AppColors.primary : Colors.white,
          ),
        ),
      ),
    );
  }
}
