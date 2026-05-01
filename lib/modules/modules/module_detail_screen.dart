import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../app/routes.dart';
import '../../data/models/kit_model.dart';
import '../../data/models/section_model.dart';
import '../../data/providers/progress_provider.dart';
import '../../data/providers/section_data_provider.dart';
import '../../widgets/premium_card.dart';
import '../../widgets/responsive.dart';

class ModuleDetailScreen extends StatelessWidget {
  const ModuleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kit = Get.arguments as KitModel;
    final provider = Get.find<ProgressProvider>();
    final sectionData = Get.find<SectionDataProvider>();

    return Obx(() {
      final progress = provider.getKitProgressFor(kit);
      final completedCount = provider.getKitCompletedCount(kit);
      final totalCount = provider.getKitTotalCount(kit);

      // Group sections by subGroup, preserving insertion order
      final grouped = <String, List<SectionModel>>{};
      for (final s in kit.sections) {
        final key = s.subGroup ?? 'Trackers';
        grouped.putIfAbsent(key, () => []).add(s);
      }

      return Scaffold(
        backgroundColor: AppColors.background,
        body: ResponsiveSliverBody(
          slivers: [
            _buildAppBar(kit, progress, completedCount, totalCount),
            // ── Overview group (existing lessons) ──────────────────────────
            if (kit.lessons.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: _GroupHeader(label: 'Overview', kitColor: kit.color),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => _LessonTile(
                      kit: kit,
                      lesson: kit.lessons[i],
                      index: i,
                      provider: provider,
                    ),
                    childCount: kit.lessons.length,
                  ),
                ),
              ),
            ],
            // ── Section sub-groups (interactive trackers) ──────────────────
            for (final entry in grouped.entries) ...[
              SliverToBoxAdapter(
                child: _GroupHeader(label: entry.key, kitColor: kit.color),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => _SectionTile(
                      kit: kit,
                      section: entry.value[i],
                      sectionData: sectionData,
                    ),
                    childCount: entry.value.length,
                  ),
                ),
              ),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      );
    });
  }

  SliverAppBar _buildAppBar(
      KitModel kit, double progress, int completedCount, int totalCount) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      backgroundColor: kit.color,
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
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.forKit(kit.color),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -30,
                right: -30,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 56, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.3)),
                            ),
                            child: Icon(kit.icon, color: Colors.white, size: 28),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  kit.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  kit.subtitle,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.8),
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '$completedCount/$totalCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'items',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.7),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.white.withValues(alpha: 0.25),
                          valueColor:
                              const AlwaysStoppedAnimation(Colors.white),
                          minHeight: 7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  final String label;
  final Color kitColor;
  const _GroupHeader({required this.label, required this.kitColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: kitColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTile extends StatelessWidget {
  final KitModel kit;
  final SectionModel section;
  final SectionDataProvider sectionData;

  const _SectionTile({
    required this.kit,
    required this.section,
    required this.sectionData,
  });

  IconData _patternIcon(SectionPattern p) {
    switch (p) {
      case SectionPattern.recordList:
        return Icons.table_rows_rounded;
      case SectionPattern.checklist:
        return Icons.checklist_rounded;
      case SectionPattern.raciMatrix:
        return Icons.grid_on_rounded;
      case SectionPattern.sopProcess:
        return Icons.list_alt_rounded;
      case SectionPattern.financialGrid:
        return Icons.calculate_rounded;
      case SectionPattern.catalog:
        return Icons.book_rounded;
      case SectionPattern.singleForm:
        return Icons.description_rounded;
      case SectionPattern.roadmap:
        return Icons.timeline_rounded;
    }
  }

  String _patternLabel(SectionPattern p) {
    switch (p) {
      case SectionPattern.recordList:
        return 'Tracker';
      case SectionPattern.checklist:
        return 'Checklist';
      case SectionPattern.raciMatrix:
        return 'RACI';
      case SectionPattern.sopProcess:
        return 'SOP';
      case SectionPattern.financialGrid:
        return 'Finance';
      case SectionPattern.catalog:
        return 'Catalog';
      case SectionPattern.singleForm:
        return 'Form';
      case SectionPattern.roadmap:
        return 'Roadmap';
    }
  }

  String _badgeText() {
    switch (section.pattern) {
      case SectionPattern.recordList:
      case SectionPattern.catalog:
        final n = sectionData.recordCount(section.id);
        return n == 0 ? 'Empty' : '$n entr${n == 1 ? "y" : "ies"}';
      case SectionPattern.checklist:
        final total = section.seedRows?.length ?? 0;
        final filled = sectionData.cellCount(section.id);
        return total > 0 ? '$filled/$total' : '${sectionData.recordCount(section.id)} items';
      case SectionPattern.raciMatrix:
      case SectionPattern.financialGrid:
      case SectionPattern.roadmap:
        final n = sectionData.cellCount(section.id);
        return n == 0 ? 'Empty' : '$n cell${n == 1 ? "" : "s"}';
      case SectionPattern.sopProcess:
        final total = section.seedRows?.length ?? 0;
        return total == 0 ? 'View' : '$total steps';
      case SectionPattern.singleForm:
        return sectionData.hasForm(section.id) ? 'Saved' : 'Not started';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isComplete = sectionData.isComplete(section.id);

    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.section,
        arguments: {'kit': kit, 'section': section},
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isComplete
              ? kit.color.withValues(alpha: 0.04)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isComplete
                ? kit.color.withValues(alpha: 0.3)
                : AppColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: isComplete
                  ? kit.color.withValues(alpha: 0.06)
                  : Colors.black.withValues(alpha: 0.02),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isComplete
                    ? kit.color
                    : kit.color.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isComplete
                      ? kit.color
                      : kit.color.withValues(alpha: 0.25),
                ),
              ),
              child: Icon(
                isComplete ? Icons.check_rounded : _patternIcon(section.pattern),
                color: isComplete ? Colors.white : kit.color,
                size: 18,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    section.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isComplete ? kit.color : AppColors.textPrimary,
                      letterSpacing: -0.1,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      GradientBadge(
                        label: _patternLabel(section.pattern),
                        color: kit.color,
                        icon: _patternIcon(section.pattern),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _badgeText(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textHint,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _LessonTile extends StatelessWidget {
  final KitModel kit;
  final LessonModel lesson;
  final int index;
  final ProgressProvider provider;

  const _LessonTile({
    required this.kit,
    required this.lesson,
    required this.index,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final isComplete = provider.isLessonComplete(lesson.id);
    final isQuiz = lesson.type == LessonType.quiz;

    return GestureDetector(
      onTap: () {
        if (isQuiz) {
          Get.toNamed(Routes.quiz, arguments: {'kit': kit, 'lesson': lesson});
        } else {
          Get.to(() => LessonReaderScreen(kit: kit, lesson: lesson));
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isComplete
              ? kit.color.withValues(alpha: 0.04)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isComplete
                ? kit.color.withValues(alpha: 0.3)
                : AppColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: isComplete
                  ? kit.color.withValues(alpha: 0.06)
                  : Colors.black.withValues(alpha: 0.02),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Step number / status icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isComplete
                    ? kit.color
                    : isQuiz
                        ? AppColors.warning.withValues(alpha: 0.12)
                        : AppColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isComplete
                      ? kit.color
                      : isQuiz
                          ? AppColors.warning.withValues(alpha: 0.3)
                          : AppColors.border,
                ),
              ),
              child: isComplete
                  ? const Icon(Icons.check_rounded,
                      color: Colors.white, size: 18)
                  : isQuiz
                      ? const Icon(Icons.quiz_rounded,
                          color: AppColors.warning, size: 18)
                      : Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isComplete ? kit.color : AppColors.textPrimary,
                      letterSpacing: -0.1,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.access_time_rounded,
                          size: 12, color: AppColors.textHint),
                      const SizedBox(width: 3),
                      Text(
                        lesson.duration,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GradientBadge(
                        label: isQuiz ? 'Quiz' : 'Read',
                        color:
                            isQuiz ? AppColors.warning : kit.color,
                        icon: isQuiz
                            ? Icons.quiz_rounded
                            : Icons.menu_book_rounded,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textHint,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Lesson Reader ─────────────────────────────────────────────────────────────

class LessonReaderScreen extends StatelessWidget {
  final KitModel kit;
  final LessonModel lesson;

  const LessonReaderScreen({
    super.key,
    required this.kit,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Get.find<ProgressProvider>();
    final isComplete = provider.isLessonComplete(lesson.id);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          kit.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          if (isComplete)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.check_circle_rounded,
                  color: AppColors.success, size: 22),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header chip
            GradientBadge(
              label: kit.title.toUpperCase(),
              color: kit.color,
              icon: kit.icon,
            ),
            const SizedBox(height: 14),
            Text(
              lesson.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
                height: 1.2,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.access_time_rounded,
                    size: 14, color: AppColors.textSecondary),
                const SizedBox(width: 4),
                Text(
                  lesson.duration,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: AppColors.textHint,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Reading',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Divider(color: AppColors.border),
            const SizedBox(height: 20),
            // Content
            _buildContent(),
            // Key Takeaways
            if (lesson.keyPoints.isNotEmpty) ...[
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kit.color.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kit.color.withValues(alpha: 0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: kit.color.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.lightbulb_rounded,
                              color: kit.color, size: 16),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Key Takeaways',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: kit.color,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    ...lesson.keyPoints.asMap().entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 22,
                              height: 22,
                              margin: const EdgeInsets.only(top: 1),
                              decoration: BoxDecoration(
                                color: kit.color.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  '${entry.key + 1}',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: kit.color,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                entry.value,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textPrimary,
                                  height: 1.55,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isComplete ? AppColors.success : kit.color,
                ),
                icon: Icon(
                  isComplete ? Icons.check_circle_rounded : Icons.done_rounded,
                  size: 18,
                ),
                onPressed: () {
                  if (!isComplete) {
                    provider.markLessonComplete(lesson.id);
                  }
                  Get.back();
                },
                label: Text(isComplete ? 'Completed' : 'Mark as Complete'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    final paragraphs = lesson.content.split('\n\n');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: paragraphs.map((para) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: _buildRichText(para),
        );
      }).toList(),
    );
  }

  Widget _buildRichText(String text) {
    final spans = <TextSpan>[];
    final regex = RegExp(r'\*\*(.*?)\*\*');
    int lastEnd = 0;

    for (final match in regex.allMatches(text)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(
          text: text.substring(lastEnd, match.start),
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.textPrimary,
            height: 1.75,
          ),
        ));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: kit.color,
          height: 1.75,
        ),
      ));
      lastEnd = match.end;
    }

    if (lastEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastEnd),
        style: const TextStyle(
          fontSize: 15,
          color: AppColors.textPrimary,
          height: 1.75,
        ),
      ));
    }

    return RichText(text: TextSpan(children: spans));
  }
}
