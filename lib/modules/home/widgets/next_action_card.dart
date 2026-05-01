import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/theme.dart';
import '../../../app/routes.dart';
import '../../../data/models/kit_model.dart';
import '../../../data/services/blueprint_aggregator.dart';

/// Combined "Blueprint" entry card + "What to do next" recommendation.
/// Surfaces the highest-impact incomplete tracker, with a tap-through to it,
/// and a "View Blueprint" CTA to open the full document.
class NextActionCard extends StatelessWidget {
  final Blueprint blueprint;
  const NextActionCard({super.key, required this.blueprint});

  @override
  Widget build(BuildContext context) {
    final next = blueprint.nextActions.isNotEmpty ? blueprint.nextActions.first : null;
    final color = blueprint.health.overallPercent >= 75
        ? AppColors.success
        : blueprint.health.overallPercent >= 50
            ? AppColors.kitFinance
            : blueprint.health.overallPercent >= 20
                ? AppColors.warning
                : AppColors.accent;

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Blueprint header — always shown, taps to open Blueprint screen
          GestureDetector(
            onTap: () => Get.toNamed(Routes.blueprint),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: AppGradients.hero,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.22),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.description_rounded,
                        color: Colors.white, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Startup Blueprint',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.2,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Health: ${blueprint.health.overallPercent}% · ${blueprint.health.label}',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_rounded,
                      color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
          // Next-action recommendation
          if (next != null)
            GestureDetector(
              onTap: () => _openSection(next),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.flag_rounded,
                        color: color,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'NEXT UP',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.8,
                                  color: color,
                                ),
                              ),
                              const SizedBox(width: 6),
                              if (next.priority == 1)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 1),
                                  decoration: BoxDecoration(
                                    color: AppColors.accent,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    'CRITICAL',
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 0.5,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          Text(
                            next.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                              letterSpacing: -0.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            next.reason,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded,
                        color: AppColors.textHint, size: 20),
                  ],
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.celebration_rounded,
                      color: AppColors.success, size: 22),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'No critical gaps. Keep iterating!',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _openSection(NextAction next) {
    if (next.section == null) {
      Get.toNamed(Routes.blueprint);
      return;
    }
    final kit = startupKits.firstWhere(
      (k) => k.id == next.section!.kitId,
      orElse: () => startupKits.first,
    );
    Get.toNamed(Routes.section,
        arguments: {'kit': kit, 'section': next.section});
  }
}
