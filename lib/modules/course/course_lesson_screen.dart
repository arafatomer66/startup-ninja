import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../app/routes.dart';
import '../../data/courses/startup_101.dart';
import '../../data/models/course_model.dart';
import '../../data/providers/course_progress_provider.dart';
import '../../widgets/responsive.dart';
import 'course_celebration.dart';

class CourseLessonScreen extends StatelessWidget {
  const CourseLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final week = args['week'] as CourseWeek;
    final index = args['index'] as int;
    final lesson = week.lessons[index];
    final tier = tierForWeek(week);
    final provider = Get.find<CourseProgressProvider>();
    final itemKey = 'lesson.$index';

    return Obx(() {
      final done = provider.isItemDone(week.id, itemKey);

      return Scaffold(
        backgroundColor: AppColors.background,
        body: ResponsiveSliverBody(
          slivers: [
            SliverToBoxAdapter(
              child: _LessonHero(
                week: week,
                index: index,
                lesson: lesson,
                tier: tier,
                done: done,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => _ContentBlock(
                    block: lesson.blocks[i],
                    color: tier.color,
                  ),
                  childCount: lesson.blocks.length,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 56),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (provider.toggleWeekItem(week, itemKey)) {
                            celebrateWeek(week);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              done ? AppColors.success : tier.color,
                        ),
                        icon: Icon(
                          done
                              ? Icons.check_circle_rounded
                              : Icons.radio_button_unchecked_rounded,
                          size: 20,
                        ),
                        label: Text(done
                            ? 'Lesson completed — tap to undo'
                            : 'Mark lesson as complete'),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _LessonNav(week: week, index: index, done: done),
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

class _LessonHero extends StatelessWidget {
  final CourseWeek week;
  final int index;
  final CourseLesson lesson;
  final CourseTier tier;
  final bool done;

  const _LessonHero({
    required this.week,
    required this.index,
    required this.lesson,
    required this.tier,
    required this.done,
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
                      'LESSON ${week.number}.${index + 1} · WEEK ${week.number}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  if (done) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppRadius.xs),
                      ),
                      child: Text(
                        'DONE',
                        style: TextStyle(
                          color: tier.color,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 18),
              Text(
                lesson.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                lesson.description,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 13.5,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.schedule_rounded,
                      size: 14, color: Colors.white.withValues(alpha: 0.8)),
                  const SizedBox(width: 5),
                  Text(
                    '${_readMinutes(lesson)} min read',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Icon(Icons.view_agenda_rounded,
                      size: 14, color: Colors.white.withValues(alpha: 0.8)),
                  const SizedBox(width: 5),
                  Text(
                    '${lesson.blocks.length} sections',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static int _readMinutes(CourseLesson lesson) {
    final words = lesson.blocks
        .fold<int>(0, (s, b) => s + b.body.split(RegExp(r'\s+')).length);
    return (words / 200).ceil().clamp(1, 30);
  }
}

class _ContentBlock extends StatelessWidget {
  final LessonBlock block;
  final Color color;

  const _ContentBlock({required this.block, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
        boxShadow: AppShadows.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 16,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                block.heading.toUpperCase(),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.0,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            block.body,
            style: const TextStyle(
              fontSize: 14,
              height: 1.65,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonNav extends StatelessWidget {
  final CourseWeek week;
  final int index;
  final bool done;

  const _LessonNav({
    required this.week,
    required this.index,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    final hasPrev = index > 0;
    final hasNext = index < week.lessons.length - 1;

    // Once the lesson is done, the next step becomes the primary action.
    Widget nextButton() {
      final label = Text('Lesson ${week.number}.${index + 2}');
      const icon = Icon(Icons.arrow_forward_rounded, size: 18);
      void go() => Get.offNamed(Routes.courseLesson,
          arguments: {'week': week, 'index': index + 1});
      return done
          ? ElevatedButton.icon(onPressed: go, icon: label, label: icon)
          : OutlinedButton.icon(onPressed: go, icon: label, label: icon);
    }

    return Row(
      children: [
        if (hasPrev)
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => Get.offNamed(Routes.courseLesson,
                  arguments: {'week': week, 'index': index - 1}),
              icon: const Icon(Icons.arrow_back_rounded, size: 18),
              label: Text('Lesson ${week.number}.$index'),
            ),
          ),
        if (hasPrev && hasNext) const SizedBox(width: AppSpacing.md),
        if (hasNext) Expanded(child: nextButton()),
        if (!hasNext) ...[
          if (hasPrev) const SizedBox(width: AppSpacing.md),
          Expanded(
            child: done
                ? ElevatedButton.icon(
                    onPressed: Get.back,
                    icon: const Icon(Icons.checklist_rounded, size: 18),
                    label: Text('Finish Week ${week.number} checklist'),
                  )
                : OutlinedButton.icon(
                    onPressed: Get.back,
                    icon: const Icon(Icons.checklist_rounded, size: 18),
                    label: Text('Back to Week ${week.number}'),
                  ),
          ),
        ],
      ],
    );
  }
}
