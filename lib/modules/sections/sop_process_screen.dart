import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../data/models/kit_model.dart';
import '../../data/models/section_model.dart';
import '../../data/providers/section_data_provider.dart';
import '../../widgets/responsive.dart';

/// SOP pattern: ordered process steps (from `seedRows`). Each step has a name,
/// estimated time, and an output document. User can mark each step as
/// adopted/customized in their org via a per-step checkbox stored as a cell.
class SopProcessScreen extends StatelessWidget {
  final KitModel kit;
  final SectionModel section;
  const SopProcessScreen({super.key, required this.kit, required this.section});

  @override
  Widget build(BuildContext context) {
    final data = Get.find<SectionDataProvider>();
    final steps = section.seedRows ?? const [];

    final totalMinutes = steps.fold<int>(0, (sum, s) {
      final m = s['minutes'];
      if (m is int) return sum + m;
      if (m is num) return sum + m.toInt();
      return sum;
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          section.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: Obx(() {
        final cells = data.getCells(section.id);
        final adopted = steps
            .where((s) => cells['${s["key"]}|adopted'] == true)
            .length;

        return ResponsiveContent(
          child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 32),
          children: [
            _SummaryCard(
              kitColor: kit.color,
              steps: steps.length,
              minutes: totalMinutes,
              adopted: adopted,
              helpText: section.helpText,
            ),
            const SizedBox(height: 18),
            for (int i = 0; i < steps.length; i++) ...[
              _SopStepTile(
                kit: kit,
                index: i,
                step: steps[i],
                adopted: cells['${steps[i]["key"]}|adopted'] == true,
                onToggle: () => data.setCell(
                  section.id,
                  steps[i]['key'] as String,
                  'adopted',
                  cells['${steps[i]["key"]}|adopted'] != true,
                ),
              ),
            ],
          ],
          ),
        );
      }),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final Color kitColor;
  final int steps;
  final int minutes;
  final int adopted;
  final String? helpText;

  const _SummaryCard({
    required this.kitColor,
    required this.steps,
    required this.minutes,
    required this.adopted,
    this.helpText,
  });

  @override
  Widget build(BuildContext context) {
    String fmtTime(int m) {
      if (m < 60) return '$m min';
      final h = m ~/ 60;
      final r = m % 60;
      return r == 0 ? '${h}h' : '${h}h ${r}m';
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kitColor,
            Color.lerp(kitColor, Colors.white, 0.25)!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _StatChip(label: 'Steps', value: '$steps'),
              const SizedBox(width: 8),
              _StatChip(label: 'Time', value: fmtTime(minutes)),
              const SizedBox(width: 8),
              _StatChip(label: 'Adopted', value: '$adopted/$steps'),
            ],
          ),
          if (helpText != null) ...[
            const SizedBox(height: 14),
            Text(
              helpText!,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.92),
                height: 1.45,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  const _StatChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: Colors.white.withValues(alpha: 0.85),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SopStepTile extends StatelessWidget {
  final KitModel kit;
  final int index;
  final Map<String, dynamic> step;
  final bool adopted;
  final VoidCallback onToggle;

  const _SopStepTile({
    required this.kit,
    required this.index,
    required this.step,
    required this.adopted,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final sopName = step['sop'] as String?;
    final activity = step['activity'] as String? ?? '';
    final minutes = step['minutes'];
    final output = step['output'] as String?;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: adopted
            ? kit.color.withValues(alpha: 0.06)
            : AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: adopted
              ? kit.color.withValues(alpha: 0.4)
              : AppColors.border,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: adopted ? kit.color : AppColors.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: adopted ? kit.color : AppColors.border,
                ),
              ),
              child: adopted
                  ? const Icon(Icons.check_rounded,
                      color: Colors.white, size: 18)
                  : Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textSecondary,
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (sopName != null && sopName.isNotEmpty) ...[
                  Text(
                    sopName.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.6,
                      color: kit.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  activity,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 10,
                  runSpacing: 4,
                  children: [
                    if (minutes != null)
                      _MetaChip(
                        icon: Icons.access_time_rounded,
                        label: minutes is num
                            ? '${minutes.toInt()} min'
                            : minutes.toString(),
                      ),
                    if (output != null && output.isNotEmpty)
                      _MetaChip(
                        icon: Icons.description_rounded,
                        label: output,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _MetaChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
