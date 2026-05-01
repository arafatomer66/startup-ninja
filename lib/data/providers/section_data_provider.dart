import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'progress_provider.dart';

enum FinanceScenario { conservative, base, optimistic }

class SectionDataProvider extends GetxService {
  final _box = GetStorage();
  final _refreshTrigger = 0.obs;

  /// Active scenario for financialGrid sections. Cells are stored per-scenario.
  /// `base` is the default and is what the Blueprint aggregator reads.
  final activeScenario = FinanceScenario.base.obs;

  void setActiveScenario(FinanceScenario s) {
    activeScenario.value = s;
    _refreshTrigger.value++;
  }

  String _scenarioSuffix(FinanceScenario? s) {
    switch (s ?? activeScenario.value) {
      case FinanceScenario.conservative:
        return '.cons';
      case FinanceScenario.base:
        return '';
      case FinanceScenario.optimistic:
        return '.opt';
    }
  }

  String _recordsKey(String sectionId) => 'section.$sectionId.records';
  String _cellsKey(String sectionId, [FinanceScenario? s]) =>
      'section.$sectionId.cells${_scenarioSuffix(s)}';
  String _formKey(String sectionId) => 'section.$sectionId.form';
  String _completedKey(String sectionId) => 'section.$sectionId.completed';
  String _touchedKey(String sectionId) => 'section.$sectionId.touchedAt';

  // ── Record list ────────────────────────────────────────────────────────────
  List<Map<String, dynamic>> getRecords(String sectionId) {
    _refreshTrigger.value;
    final raw = _box.read<List>(_recordsKey(sectionId)) ?? [];
    return raw
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList(growable: true);
  }

  void addRecord(String sectionId, Map<String, dynamic> record) {
    final list = getRecords(sectionId);
    list.add(record);
    _box.write(_recordsKey(sectionId), list);
    _touch(sectionId);
    _autoComplete(sectionId);
  }

  void updateRecord(String sectionId, int index, Map<String, dynamic> record) {
    final list = getRecords(sectionId);
    if (index < 0 || index >= list.length) return;
    list[index] = record;
    _box.write(_recordsKey(sectionId), list);
    _touch(sectionId);
  }

  void deleteRecord(String sectionId, int index) {
    final list = getRecords(sectionId);
    if (index < 0 || index >= list.length) return;
    list.removeAt(index);
    _box.write(_recordsKey(sectionId), list);
    _touch(sectionId);
  }

  // ── Cells (RACI / financialGrid / roadmap) ─────────────────────────────────
  Map<String, dynamic> getCells(String sectionId, {FinanceScenario? scenario}) {
    _refreshTrigger.value;
    final raw = _box.read<Map>(_cellsKey(sectionId, scenario)) ?? {};
    return Map<String, dynamic>.from(raw);
  }

  dynamic getCell(String sectionId, String row, String col,
      {FinanceScenario? scenario}) {
    return getCells(sectionId, scenario: scenario)['$row|$col'];
  }

  void setCell(String sectionId, String row, String col, dynamic value,
      {FinanceScenario? scenario}) {
    final cells = getCells(sectionId, scenario: scenario);
    cells['$row|$col'] = value;
    _box.write(_cellsKey(sectionId, scenario), cells);
    _touch(sectionId);
    _autoComplete(sectionId);
  }

  // ── Single form ────────────────────────────────────────────────────────────
  Map<String, dynamic> getForm(String sectionId) {
    _refreshTrigger.value;
    final raw = _box.read<Map>(_formKey(sectionId)) ?? {};
    return Map<String, dynamic>.from(raw);
  }

  void saveForm(String sectionId, Map<String, dynamic> form) {
    _box.write(_formKey(sectionId), form);
    _touch(sectionId);
    _autoComplete(sectionId);
  }

  // ── Completion ─────────────────────────────────────────────────────────────
  bool isComplete(String sectionId) {
    _refreshTrigger.value;
    return _box.read<bool>(_completedKey(sectionId)) ?? false;
  }

  void markComplete(String sectionId, bool value) {
    _box.write(_completedKey(sectionId), value);
    _refreshTrigger.value++;
    if (Get.isRegistered<ProgressProvider>()) {
      Get.find<ProgressProvider>().bumpRefresh();
    }
  }

  void _autoComplete(String sectionId) {
    if (!isComplete(sectionId)) {
      _box.write(_completedKey(sectionId), true);
    }
    _refreshTrigger.value++;
    if (Get.isRegistered<ProgressProvider>()) {
      Get.find<ProgressProvider>().bumpRefresh();
    }
  }

  void _touch(String sectionId) {
    _box.write(_touchedKey(sectionId), DateTime.now().toIso8601String());
  }

  // ── Counts (for tile badges) ───────────────────────────────────────────────
  int recordCount(String sectionId) => getRecords(sectionId).length;
  int cellCount(String sectionId) => getCells(sectionId).length;
  bool hasForm(String sectionId) => getForm(sectionId).isNotEmpty;
}
