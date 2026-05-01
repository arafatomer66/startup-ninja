import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import '../../../data/services/blueprint_aggregator.dart';

class HealthCard extends StatelessWidget {
  final HealthScore health;
  const HealthCard({super.key, required this.health});

  @override
  Widget build(BuildContext context) {
    final color = _color(health.overallPercent);

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 18, 20, 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '${health.overallPercent}',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Startup Health',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      health.label,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: color,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _SubScore(
            label: 'Completion',
            value: health.completionPercent,
            color: AppColors.primary,
          ),
          const SizedBox(height: 8),
          _SubScore(
            label: 'Trackers with data',
            value: health.trackersWithDataPercent,
            color: AppColors.kitProduct,
          ),
          const SizedBox(height: 8),
          _SubScore(
            label: 'Financial sanity',
            value: health.financialSanity,
            color: AppColors.kitFinance,
          ),
        ],
      ),
    );
  }

  Color _color(int v) {
    if (v >= 75) return AppColors.success;
    if (v >= 50) return AppColors.kitFinance;
    if (v >= 20) return AppColors.warning;
    return AppColors.accent;
  }
}

class _SubScore extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  const _SubScore(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 130,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: LinearProgressIndicator(
              value: value / 100,
              backgroundColor: color.withValues(alpha: 0.10),
              valueColor: AlwaysStoppedAnimation(color),
              minHeight: 6,
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 36,
          child: Text(
            '$value%',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
