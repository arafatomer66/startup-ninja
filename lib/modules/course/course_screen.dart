import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/theme.dart';
import '../../app/routes.dart';
import '../../data/courses/startup_101.dart';
import '../../data/courses/startup_101/bookshelf.dart';
import '../../data/models/course_model.dart';
import '../../data/providers/course_progress_provider.dart';
import '../../widgets/motion.dart';
import '../../widgets/responsive.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Get.find<CourseProgressProvider>();

    return Obx(() {
      final percent = provider.courseProgress;

      return Scaffold(
        backgroundColor: AppColors.background,
        body: ResponsiveSliverBody(
          slivers: [
            SliverToBoxAdapter(
              child: _CourseHero(provider: provider, percent: percent),
            ),
            SliverToBoxAdapter(
              child: FadeSlideIn(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: _ContinueCard(provider: provider),
                ),
              ),
            ),
            for (final tier in startup101Tiers) ...[
              SliverToBoxAdapter(
                child: _TierHeader(tier: tier, provider: provider),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => FadeSlideIn(
                      delay: Duration(milliseconds: 30 * i),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.md),
                        child: _WeekCard(
                          week: tier.weeks[i],
                          tier: tier,
                          provider: provider,
                        ),
                      ),
                    ),
                    childCount: tier.weeks.length,
                  ),
                ),
              ),
            ],
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 14),
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                      ),
                      child: const Icon(Icons.auto_stories_rounded,
                          color: AppColors.accent, size: 20),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("The Founder's Bookshelf",
                              style: Theme.of(context).textTheme.titleLarge),
                          const Text(
                            'The startup canon — and why each book earns its place',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
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
                    child: _BookCard(book: startup101Books[i]),
                  ),
                  childCount: startup101Books.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 56)),
          ],
        ),
      );
    });
  }
}

class _BookCard extends StatelessWidget {
  final CourseBook book;

  const _BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: () => launchUrl(
        Uri.parse(book.url),
        mode: LaunchMode.externalApplication,
      ),
      borderRadius: BorderRadius.circular(AppRadius.lg),
      hoverShadowColor: AppColors.accent,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 48,
              decoration: BoxDecoration(
                gradient: AppGradients.forKit(AppColors.accent),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.menu_book_rounded,
                  color: Colors.white, size: 18),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.2,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    book.author,
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.accent,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    book.why,
                    style: const TextStyle(
                      fontSize: 12.5,
                      height: 1.5,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            const Icon(Icons.open_in_new_rounded,
                size: 16, color: AppColors.textHint),
          ],
        ),
      ),
    );
  }
}

class _CourseHero extends StatelessWidget {
  final CourseProgressProvider provider;
  final double percent;

  const _CourseHero({required this.provider, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppGradients.hero,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (Navigator.of(context).canPop()) ...[
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
                  ],
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(AppRadius.xs),
                    ),
                    child: const Text(
                      'COURSE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.search),
                    child: Container(
                      width: 36,
                      height: 36,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.search_rounded,
                          color: Colors.white, size: 18),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.library),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.25)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.local_library_rounded,
                              color: Colors.white, size: 16),
                          SizedBox(width: 6),
                          Text(
                            'Library',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          courseTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.6,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          courseTagline,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            _HeroStat(
                              value: '${provider.weeksCompleted}',
                              label: 'of ${allCourseWeeks.length} weeks',
                            ),
                            const SizedBox(width: 20),
                            _HeroStat(
                              value: '${provider.courseXp}',
                              label: 'XP earned',
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _StreakChip(
                          streak: provider.streak,
                          doneToday: provider.streakDoneToday,
                        ),
                      ],
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 56,
                    lineWidth: 9,
                    percent: percent,
                    animation: true,
                    animateFromLastPercent: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${(percent * 100).toInt()}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          'complete',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    progressColor: Colors.white,
                    backgroundColor: Colors.white.withValues(alpha: 0.22),
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

/// Duolingo-style streak pill: lit flame when today counted, dim gray
/// "start today" state when the chain is cold.
class _StreakChip extends StatelessWidget {
  final int streak;
  final bool doneToday;

  const _StreakChip({required this.streak, required this.doneToday});

  @override
  Widget build(BuildContext context) {
    final lit = streak > 0;
    final text = !lit
        ? 'Start a streak — complete one lesson today'
        : doneToday
            ? '$streak day streak — today counted! 🔥'
            : '$streak day streak — keep it alive today';

    return PopIn(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: lit ? 0.22 : 0.12),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Colors.white.withValues(alpha: lit ? 0.4 : 0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.local_fire_department_rounded,
              size: 16,
              color: lit ? const Color(0xFFFFC93C) : Colors.white54,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  final String value;
  final String label;

  const _HeroStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.4,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _ContinueCard extends StatelessWidget {
  final CourseProgressProvider provider;

  const _ContinueCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    final target = provider.continueTarget;

    if (target == null) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.success.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border:
              Border.all(color: AppColors.success.withValues(alpha: 0.45)),
        ),
        child: const Row(
          children: [
            Icon(Icons.emoji_events_rounded,
                color: AppColors.success, size: 28),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                'Course complete — you went from zero to founder. 🎓',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      );
    }

    final (week, lessonIndex) = target;
    final tier = tierForWeek(week);
    final started = provider.courseDoneCount > 0;
    final subtitle = lessonIndex != null
        ? 'Lesson ${week.number}.${lessonIndex + 1} — ${week.lessons[lessonIndex].title}'
        : 'Week ${week.number} — finish the workshop & assignment';

    return HoverCard(
      onTap: () => lessonIndex != null
          ? Get.toNamed(Routes.courseLesson,
              arguments: {'week': week, 'index': lessonIndex})
          : Get.toNamed(Routes.courseWeek, arguments: week),
      borderRadius: BorderRadius.circular(AppRadius.xl),
      hoverShadowColor: tier.color,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(color: tier.color.withValues(alpha: 0.35)),
          boxShadow: AppShadows.glow(tier.color),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                gradient: AppGradients.forKit(tier.color),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: const Icon(Icons.play_arrow_rounded,
                  color: Colors.white, size: 26),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    started ? 'CONTINUE WHERE YOU LEFT OFF' : 'START THE COURSE',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.0,
                      color: tier.color,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded,
                color: AppColors.textHint),
          ],
        ),
      ),
    );
  }
}

class _TierHeader extends StatelessWidget {
  final CourseTier tier;
  final CourseProgressProvider provider;

  const _TierHeader({required this.tier, required this.provider});

  @override
  Widget build(BuildContext context) {
    final progress = provider.tierProgress(tier);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 14),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: tier.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Icon(tier.icon, color: tier.color, size: 20),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tier.title,
                    style: Theme.of(context).textTheme.titleLarge),
                Text(
                  tier.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${(progress * 100).toInt()}%',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: progress > 0 ? tier.color : AppColors.textHint,
            ),
          ),
        ],
      ),
    );
  }
}

class _WeekCard extends StatelessWidget {
  final CourseWeek week;
  final CourseTier tier;
  final CourseProgressProvider provider;

  const _WeekCard({
    required this.week,
    required this.tier,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final progress = provider.weekProgress(week);
    final done = provider.weekDoneCount(week);
    final total = provider.weekTotalCount(week);
    final isComplete = provider.isWeekComplete(week);

    return HoverCard(
      onTap: () => Get.toNamed(Routes.courseWeek, arguments: week),
      borderRadius: BorderRadius.circular(AppRadius.xl),
      hoverShadowColor: tier.color,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(
            color: isComplete
                ? tier.color.withValues(alpha: 0.4)
                : AppColors.border,
          ),
          boxShadow: AppShadows.sm,
        ),
        child: Row(
          children: [
            CircularPercentIndicator(
              radius: 26,
              lineWidth: 4,
              percent: progress,
              circularStrokeCap: CircularStrokeCap.round,
              center: isComplete
                  ? Icon(Icons.check_rounded, color: tier.color, size: 20)
                  : Text(
                      'W${week.number}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: progress > 0
                            ? tier.color
                            : AppColors.textSecondary,
                      ),
                    ),
              progressColor: tier.color,
              backgroundColor: tier.color.withValues(alpha: 0.12),
            ),
            const SizedBox(width: AppSpacing.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    week.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${week.lessons.length} lessons · workshop · assignment',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              '$done/$total',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: progress > 0 ? tier.color : AppColors.textHint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
