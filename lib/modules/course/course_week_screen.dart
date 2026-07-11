import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/theme.dart';
import '../../app/routes.dart';
import '../../data/courses/startup_101.dart';
import '../../data/models/course_model.dart';
import '../../data/providers/course_progress_provider.dart';
import '../../widgets/responsive.dart';
import 'course_celebration.dart';

class CourseWeekScreen extends StatelessWidget {
  const CourseWeekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final week = Get.arguments as CourseWeek;
    final tier = tierForWeek(week);
    final provider = Get.find<CourseProgressProvider>();

    return Obx(() {
      final progress = provider.weekProgress(week);
      final isComplete = provider.isWeekComplete(week);

      return Scaffold(
        backgroundColor: AppColors.background,
        body: ResponsiveSliverBody(
          slivers: [
            SliverToBoxAdapter(
              child: _WeekHero(
                week: week,
                tier: tier,
                progress: progress,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Lessons',
                        style: Theme.of(context).textTheme.titleLarge),
                    const Text(
                      'tap a lesson to read it',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textHint,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: _LessonTile(
                      week: week,
                      index: i,
                      color: tier.color,
                      done: provider.isItemDone(week.id, 'lesson.$i'),
                      onToggle: () {
                        if (provider.toggleWeekItem(week, 'lesson.$i')) {
                          celebrateWeek(week);
                        }
                      },
                    ),
                  ),
                  childCount: week.lessons.length,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    _CheckTile(
                      label: 'Live Workshop',
                      title: 'Build it together',
                      text: week.workshop,
                      icon: Icons.groups_rounded,
                      color: AppColors.info,
                      done: provider.isItemDone(week.id, 'workshop'),
                      onTap: () {
                        if (provider.toggleWeekItem(week, 'workshop')) {
                          celebrateWeek(week);
                        }
                      },
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    _CheckTile(
                      label: 'Assignment',
                      title: 'Ship this week\'s deliverable',
                      text: week.assignment,
                      icon: Icons.edit_note_rounded,
                      color: AppColors.warning,
                      done: provider.isItemDone(week.id, 'assignment'),
                      onTap: () {
                        if (provider.toggleWeekItem(week, 'assignment')) {
                          celebrateWeek(week);
                        }
                      },
                    ),
                    if (week.resources.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.xl),
                      _ResourcesSection(week: week, color: tier.color),
                    ],
                    const SizedBox(height: AppSpacing.lg),
                    _MilestoneCard(week: week, unlocked: isComplete),
                    const SizedBox(height: AppSpacing.lg),
                    _WeekNav(week: week),
                    const SizedBox(height: 56),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _WeekHero extends StatelessWidget {
  final CourseWeek week;
  final CourseTier tier;
  final double progress;

  const _WeekHero({
    required this.week,
    required this.tier,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.forKit(tier.color),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: Get.back,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.arrow_back_rounded,
                          color: Colors.white, size: 20),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(AppRadius.xs),
                    ),
                    child: Text(
                      'WEEK ${week.number} · ${tier.title.toUpperCase()}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          week.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.4,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          week.goal,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.85),
                            fontSize: 13,
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 18),
                  CircularPercentIndicator(
                    radius: 40,
                    lineWidth: 7,
                    percent: progress,
                    animation: true,
                    animateFromLastPercent: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    progressColor: Colors.white,
                    backgroundColor: Colors.white.withValues(alpha: 0.25),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A lesson row: tapping opens the full lesson page; the trailing
/// checkbox toggles completion without leaving the week.
class _LessonTile extends StatelessWidget {
  final CourseWeek week;
  final int index;
  final Color color;
  final bool done;
  final VoidCallback onToggle;

  const _LessonTile({
    required this.week,
    required this.index,
    required this.color,
    required this.done,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final lesson = week.lessons[index];

    return HoverCard(
      onTap: () => Get.toNamed(Routes.courseLesson,
          arguments: {'week': week, 'index': index}),
      borderRadius: BorderRadius.circular(AppRadius.lg),
      hoverShadowColor: color,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: done ? color.withValues(alpha: 0.06) : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(
            color: done ? color.withValues(alpha: 0.4) : AppColors.border,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child:
                  Icon(Icons.menu_book_rounded, color: color, size: 18),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'LESSON ${week.number}.${index + 1}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8,
                          color: color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.chevron_right_rounded,
                          size: 14, color: AppColors.textHint),
                      const Text(
                        'read',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textHint,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lesson.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.2,
                      height: 1.35,
                      color: AppColors.textPrimary,
                      decoration: done ? TextDecoration.lineThrough : null,
                      decorationColor: AppColors.textHint,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    lesson.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.5,
                      color: done
                          ? AppColors.textHint
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onToggle,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: done ? color : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: done ? color : AppColors.textHint,
                      width: 2,
                    ),
                  ),
                  child: done
                      ? const Icon(Icons.check_rounded,
                          color: Colors.white, size: 17)
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckTile extends StatelessWidget {
  final String label;
  final String title;
  final String text;
  final IconData icon;
  final Color color;
  final bool done;
  final VoidCallback onTap;

  const _CheckTile({
    required this.label,
    required this.title,
    required this.text,
    required this.icon,
    required this.color,
    required this.done,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      hoverShadowColor: color,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: done ? color.withValues(alpha: 0.06) : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(
            color: done ? color.withValues(alpha: 0.4) : AppColors.border,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.2,
                      height: 1.35,
                      color: AppColors.textPrimary,
                      decoration: done ? TextDecoration.lineThrough : null,
                      decorationColor: AppColors.textHint,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.5,
                      color: done
                          ? AppColors.textHint
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: done ? color : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: done ? color : AppColors.textHint,
                  width: 2,
                ),
              ),
              child: done
                  ? const Icon(Icons.check_rounded,
                      color: Colors.white, size: 17)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _ResourcesSection extends StatelessWidget {
  final CourseWeek week;
  final Color color;

  const _ResourcesSection({required this.week, required this.color});

  IconData _iconFor(String source) {
    final s = source.toLowerCase();
    if (s.contains('book')) return Icons.auto_stories_rounded;
    if (s.contains('video') || s.contains('course')) {
      return Icons.play_circle_fill_rounded;
    }
    if (s.contains('slide')) return Icons.slideshow_rounded;
    if (s.contains('template') || s.contains('tool')) {
      return Icons.handyman_rounded;
    }
    return Icons.article_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text('Learning Resources',
                  style: Theme.of(context).textTheme.titleLarge),
              const Spacer(),
              const Text(
                'opens in browser',
                style: TextStyle(fontSize: 12, color: AppColors.textHint),
              ),
            ],
          ),
        ),
        for (final r in week.resources)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: HoverCard(
              onTap: () => launchUrl(
                Uri.parse(r.url),
                mode: LaunchMode.externalApplication,
              ),
              borderRadius: BorderRadius.circular(AppRadius.md),
              hoverShadowColor: color,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg, vertical: AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    Icon(_iconFor(r.source), color: color, size: 20),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            r.title,
                            style: const TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.2,
                              color: AppColors.textPrimary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            r.source,
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.open_in_new_rounded,
                        size: 16, color: AppColors.textHint),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _MilestoneCard extends StatelessWidget {
  final CourseWeek week;
  final bool unlocked;

  const _MilestoneCard({required this.week, required this.unlocked});

  @override
  Widget build(BuildContext context) {
    final color = unlocked ? AppColors.success : AppColors.textHint;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: unlocked
            ? AppColors.success.withValues(alpha: 0.08)
            : AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: unlocked
              ? AppColors.success.withValues(alpha: 0.45)
              : AppColors.border,
        ),
        boxShadow: unlocked ? AppShadows.glow(AppColors.success) : null,
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Icon(
              unlocked ? Icons.emoji_events_rounded : Icons.lock_rounded,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unlocked ? 'MILESTONE REACHED' : 'MILESTONE',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  week.milestone,
                  style: TextStyle(
                    fontSize: 13.5,
                    height: 1.45,
                    fontWeight: FontWeight.w600,
                    color: unlocked
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WeekNav extends StatelessWidget {
  final CourseWeek week;

  const _WeekNav({required this.week});

  @override
  Widget build(BuildContext context) {
    final weeks = allCourseWeeks;
    final index = weeks.indexWhere((w) => w.id == week.id);
    final prev = index > 0 ? weeks[index - 1] : null;
    final next = index < weeks.length - 1 ? weeks[index + 1] : null;

    return Row(
      children: [
        if (prev != null)
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () =>
                  Get.offNamed(Routes.courseWeek, arguments: prev),
              icon: const Icon(Icons.arrow_back_rounded, size: 18),
              label: Text('Week ${prev.number}'),
            ),
          ),
        if (prev != null && next != null)
          const SizedBox(width: AppSpacing.md),
        if (next != null)
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () =>
                  Get.offNamed(Routes.courseWeek, arguments: next),
              icon: Text('Week ${next.number}'),
              label: const Icon(Icons.arrow_forward_rounded, size: 18),
            ),
          ),
      ],
    );
  }
}
