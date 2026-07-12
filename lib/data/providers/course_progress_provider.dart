import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../courses/startup_101.dart';
import '../models/course_model.dart';

/// Course completion state. Storage keys: `course.<weekId>.lesson.<i>`,
/// `course.<weekId>.workshop`, `course.<weekId>.assignment` → bool.
/// The milestone is derived — a week is complete when every lesson,
/// the workshop, and the assignment are checked.
class CourseProgressProvider extends GetxService {
  final _box = GetStorage();
  final _refreshTrigger = 0.obs;

  String _key(String weekId, String item) => 'course.$weekId.$item';

  bool isItemDone(String weekId, String item) {
    _refreshTrigger.value;
    return _box.read<bool>(_key(weekId, item)) ?? false;
  }

  void toggleItem(String weekId, String item) {
    final current = _box.read<bool>(_key(weekId, item)) ?? false;
    _box.write(_key(weekId, item), !current);
    if (!current) _recordActivity();
    _refreshTrigger.value++;
  }

  // ── Streak ──────────────────────────────────────────────────────────
  // `streak.last` (yyyy-mm-dd) + `streak.count`. Completing any course
  // item counts as activity; a missed day resets the chain.

  static String _dayString(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  void _recordActivity() {
    final now = DateTime.now();
    final today = _dayString(now);
    final last = _box.read<String>('streak.last');
    if (last == today) return;
    final yesterday = _dayString(now.subtract(const Duration(days: 1)));
    final count = last == yesterday ? (_box.read<int>('streak.count') ?? 0) + 1 : 1;
    _box.write('streak.last', today);
    _box.write('streak.count', count);
  }

  /// Live streak: yesterday's chain survives until midnight, older ones are 0.
  int get streak {
    _refreshTrigger.value;
    final last = _box.read<String>('streak.last');
    if (last == null) return 0;
    final now = DateTime.now();
    if (last != _dayString(now) &&
        last != _dayString(now.subtract(const Duration(days: 1)))) {
      return 0;
    }
    return _box.read<int>('streak.count') ?? 0;
  }

  bool get streakDoneToday {
    _refreshTrigger.value;
    return _box.read<String>('streak.last') == _dayString(DateTime.now());
  }

  // ── XP (derived, never stored) ──────────────────────────────────────
  static const lessonXp = 10;
  static const workshopXp = 20;
  static const assignmentXp = 20;

  int weekXp(CourseWeek week) {
    var xp = 0;
    for (var i = 0; i < week.lessons.length; i++) {
      if (isItemDone(week.id, 'lesson.$i')) xp += lessonXp;
    }
    if (isItemDone(week.id, 'workshop')) xp += workshopXp;
    if (isItemDone(week.id, 'assignment')) xp += assignmentXp;
    return xp;
  }

  int get courseXp => allCourseWeeks.fold(0, (s, w) => s + weekXp(w));

  /// Toggle an item and report whether this toggle just completed the
  /// whole week — so the UI can celebrate the milestone once.
  bool toggleWeekItem(CourseWeek week, String item) {
    final wasComplete = isWeekComplete(week);
    toggleItem(week.id, item);
    return !wasComplete && isWeekComplete(week);
  }

  int weekTotalCount(CourseWeek week) => week.lessons.length + 2;

  int weekDoneCount(CourseWeek week) {
    _refreshTrigger.value;
    var done = 0;
    for (var i = 0; i < week.lessons.length; i++) {
      if (isItemDone(week.id, 'lesson.$i')) done++;
    }
    if (isItemDone(week.id, 'workshop')) done++;
    if (isItemDone(week.id, 'assignment')) done++;
    return done;
  }

  double weekProgress(CourseWeek week) =>
      (weekDoneCount(week) / weekTotalCount(week)).clamp(0.0, 1.0);

  bool isWeekComplete(CourseWeek week) =>
      weekDoneCount(week) >= weekTotalCount(week);

  int get courseTotalCount =>
      allCourseWeeks.fold(0, (s, w) => s + weekTotalCount(w));

  int get courseDoneCount =>
      allCourseWeeks.fold(0, (s, w) => s + weekDoneCount(w));

  double get courseProgress {
    final total = courseTotalCount;
    return total > 0 ? (courseDoneCount / total).clamp(0.0, 1.0) : 0.0;
  }

  int get weeksCompleted => allCourseWeeks.where(isWeekComplete).length;

  double tierProgress(CourseTier tier) {
    final total = tier.weeks.fold(0, (s, w) => s + weekTotalCount(w));
    if (total == 0) return 0.0;
    final done = tier.weeks.fold(0, (s, w) => s + weekDoneCount(w));
    return (done / total).clamp(0.0, 1.0);
  }

  /// First week that isn't complete yet — where the student should resume.
  CourseWeek get currentWeek => allCourseWeeks.firstWhere(
        (w) => !isWeekComplete(w),
        orElse: () => allCourseWeeks.last,
      );

  /// Exact resume point: the first incomplete lesson (week, lessonIndex),
  /// or (week, null) when the lessons are read but workshop/assignment
  /// remain — meaning the week checklist is the right destination.
  /// Null when the whole course is complete.
  (CourseWeek, int?)? get continueTarget {
    for (final w in allCourseWeeks) {
      if (isWeekComplete(w)) continue;
      for (var i = 0; i < w.lessons.length; i++) {
        if (!isItemDone(w.id, 'lesson.$i')) return (w, i);
      }
      return (w, null);
    }
    return null;
  }
}
