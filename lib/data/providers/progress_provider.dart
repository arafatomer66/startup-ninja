import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/kit_model.dart';

class ProgressProvider extends GetxService {
  final _box = GetStorage();

  static const _completedKey = 'completed_lessons';
  static const _userNameKey = 'user_name';
  static const _onboardedKey = 'onboarded';

  // Reactive trigger — incrementing this notifies all Obx() listeners
  final _refreshTrigger = 0.obs;

  /// Allow other services (e.g. SectionDataProvider) to nudge listeners
  /// when section progress changes affect kit completion %.
  void bumpRefresh() => _refreshTrigger.value++;

  Set<String> get completedLessons {
    _refreshTrigger.value; // Subscribe to changes
    final list = _box.read<List>(_completedKey) ?? [];
    return list.cast<String>().toSet();
  }

  void markLessonComplete(String lessonId) {
    final current = completedLessons;
    if (current.contains(lessonId)) return;
    current.add(lessonId);
    _box.write(_completedKey, current.toList());
    _refreshTrigger.value++; // Notify all Obx() widgets
  }

  bool isLessonComplete(String lessonId) => completedLessons.contains(lessonId);

  /// Kit-aware progress: counts completed lessons + completed sections
  /// against the kit's total of (lessons + sections).
  double getKitProgressFor(KitModel kit) {
    _refreshTrigger.value;
    final totalLessons = kit.lessons.length;
    final totalSections = kit.sections.length;
    final denom = totalLessons + totalSections;
    if (denom == 0) return 0.0;

    final lessonDone = kit.lessons.where((l) => isLessonComplete(l.id)).length;

    int sectionDone = 0;
    for (final section in kit.sections) {
      final flag = _box.read<bool>('section.${section.id}.completed') ?? false;
      if (flag) sectionDone++;
    }

    return ((lessonDone + sectionDone) / denom).clamp(0.0, 1.0);
  }

  int getKitCompletedCount(KitModel kit) {
    _refreshTrigger.value;
    final lessonDone = kit.lessons.where((l) => isLessonComplete(l.id)).length;
    int sectionDone = 0;
    for (final section in kit.sections) {
      final flag = _box.read<bool>('section.${section.id}.completed') ?? false;
      if (flag) sectionDone++;
    }
    return lessonDone + sectionDone;
  }

  int getKitTotalCount(KitModel kit) => kit.lessons.length + kit.sections.length;

  // Legacy signature retained for callers passing a totalLessons int directly.
  // New callers should use getKitProgressFor(kit).
  double getKitProgress(String kitId, int totalLessons) {
    final count = completedLessons.where((id) {
      const prefixMap = {
        'formation': ['f'],
        'hr': ['hr'],
        'sop': ['s'],
        'product': ['p'],
        'procurement': ['pr'],
        'business': ['b'],
        'finance': ['fn'],
      };
      final prefixes = prefixMap[kitId] ?? [];
      return prefixes.any((prefix) =>
          id.startsWith(prefix) &&
          id.length > prefix.length &&
          RegExp(r'\d').hasMatch(id[prefix.length]));
    }).length;
    return totalLessons > 0 ? (count / totalLessons).clamp(0.0, 1.0) : 0.0;
  }

  int getTotalCompleted() => completedLessons.length;

  String get userName => _box.read<String>(_userNameKey) ?? 'Ninja';
  void setUserName(String name) => _box.write(_userNameKey, name);

  bool get isOnboarded => _box.read<bool>(_onboardedKey) ?? false;
  void setOnboarded() => _box.write(_onboardedKey, true);

  void reset() {
    _box.erase();
    _refreshTrigger.value++;
  }
}
