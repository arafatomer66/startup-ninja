import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../data/models/kit_model.dart';
import '../../data/models/section_model.dart';
import '../../data/providers/section_data_provider.dart';
import '../../widgets/responsive.dart';

/// Roadmap pattern: list of items (records) with start/end period markers
/// against `colAxis` (e.g. quarters or weeks). Stored as records so users can
/// add/remove items dynamically.
class RoadmapScreen extends StatelessWidget {
  final KitModel kit;
  final SectionModel section;
  const RoadmapScreen({super.key, required this.kit, required this.section});

  @override
  Widget build(BuildContext context) {
    final data = Get.find<SectionDataProvider>();
    final periods = section.colAxis ?? const [];

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
        final records = data.getRecords(section.id);
        return ResponsiveContent(
          child: Column(
          children: [
            if (section.helpText != null)
              Container(
                margin: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: kit.color.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: kit.color.withValues(alpha: 0.2)),
                ),
                child: Text(
                  section.helpText!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textPrimary,
                    height: 1.45,
                  ),
                ),
              ),
            Expanded(
              child: records.isEmpty
                  ? _empty()
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 14, 20, 100),
                      itemCount: records.length,
                      itemBuilder: (_, i) => _RoadmapItem(
                        kit: kit,
                        record: records[i],
                        periods: periods,
                        onTap: () =>
                            _editor(context, data, i, records[i], periods),
                      ),
                    ),
            ),
          ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kit.color,
        foregroundColor: Colors.white,
        elevation: 0,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add Item',
            style: TextStyle(fontWeight: FontWeight.w700)),
        onPressed: () =>
            _editor(context, Get.find<SectionDataProvider>(), null, null, periods),
      ),
    );
  }

  Widget _empty() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: kit.color.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(Icons.timeline_rounded, color: kit.color, size: 36),
            ),
            const SizedBox(height: 18),
            const Text(
              'No items yet',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Add your first ${section.title.toLowerCase()} item.',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editor(BuildContext ctx, SectionDataProvider data, int? index,
      Map<String, dynamic>? existing, List<String> periods) {
    Get.bottomSheet(
      _RoadmapEditor(
        kit: kit,
        section: section,
        periods: periods,
        initial: existing,
        onSave: (rec) {
          if (index == null) {
            data.addRecord(section.id, rec);
          } else {
            data.updateRecord(section.id, index, rec);
          }
          Get.back();
        },
        onDelete: index == null
            ? null
            : () {
                data.deleteRecord(section.id, index);
                Get.back();
              },
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}

class _RoadmapItem extends StatelessWidget {
  final KitModel kit;
  final Map<String, dynamic> record;
  final List<String> periods;
  final VoidCallback onTap;

  const _RoadmapItem({
    required this.kit,
    required this.record,
    required this.periods,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final start = record['start_period'] as String?;
    final end = record['end_period'] as String?;
    final startIdx = periods.indexOf(start ?? '');
    final endIdx = periods.indexOf(end ?? '');
    final priority = record['priority'] as String?;
    final priorityColor = priority == 'High'
        ? AppColors.accent
        : priority == 'Med'
            ? AppColors.warning
            : AppColors.info;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    record['title'] as String? ?? 'Untitled',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (priority != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: priorityColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      priority,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: priorityColor,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            // Period bar
            if (periods.isNotEmpty)
              SizedBox(
                height: 22,
                child: Row(
                  children: List.generate(periods.length, (i) {
                    final inRange = startIdx >= 0 &&
                        endIdx >= 0 &&
                        i >= startIdx &&
                        i <= endIdx;
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                          color: inRange
                              ? kit.color
                              : kit.color.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          periods[i],
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: inRange
                                ? Colors.white
                                : kit.color.withValues(alpha: 0.7),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _RoadmapEditor extends StatefulWidget {
  final KitModel kit;
  final SectionModel section;
  final List<String> periods;
  final Map<String, dynamic>? initial;
  final ValueChanged<Map<String, dynamic>> onSave;
  final VoidCallback? onDelete;

  const _RoadmapEditor({
    required this.kit,
    required this.section,
    required this.periods,
    required this.initial,
    required this.onSave,
    required this.onDelete,
  });

  @override
  State<_RoadmapEditor> createState() => _RoadmapEditorState();
}

class _RoadmapEditorState extends State<_RoadmapEditor> {
  late Map<String, dynamic> _draft;
  String? _error;

  @override
  void initState() {
    super.initState();
    _draft = widget.initial == null
        ? <String, dynamic>{}
        : Map<String, dynamic>.from(widget.initial!);
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        constraints: BoxConstraints(maxHeight: mq.size.height * 0.92),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 14),
            Container(
              width: 38,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.initial == null ? 'New Item' : 'Edit Item',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  if (widget.onDelete != null)
                    IconButton(
                      onPressed: widget.onDelete,
                      icon: const Icon(Icons.delete_outline_rounded,
                          color: AppColors.accent),
                    ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.border),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label('Title'),
                    TextFormField(
                      initialValue: _draft['title'] as String? ?? '',
                      decoration: const InputDecoration(
                        hintText: 'Feature / milestone name',
                        isDense: true,
                      ),
                      onChanged: (v) => _draft['title'] = v,
                    ),
                    const SizedBox(height: 14),
                    _label('Priority'),
                    DropdownButtonFormField<String>(
                      initialValue: _draft['priority'] as String?,
                      items: const ['High', 'Med', 'Low']
                          .map((o) =>
                              DropdownMenuItem(value: o, child: Text(o)))
                          .toList(),
                      decoration: const InputDecoration(isDense: true),
                      onChanged: (v) => setState(() => _draft['priority'] = v),
                    ),
                    const SizedBox(height: 14),
                    _label('Start Period'),
                    DropdownButtonFormField<String>(
                      initialValue: _draft['start_period'] as String?,
                      items: widget.periods
                          .map((p) =>
                              DropdownMenuItem(value: p, child: Text(p)))
                          .toList(),
                      decoration: const InputDecoration(isDense: true),
                      onChanged: (v) =>
                          setState(() => _draft['start_period'] = v),
                    ),
                    const SizedBox(height: 14),
                    _label('End Period'),
                    DropdownButtonFormField<String>(
                      initialValue: _draft['end_period'] as String?,
                      items: widget.periods
                          .map((p) =>
                              DropdownMenuItem(value: p, child: Text(p)))
                          .toList(),
                      decoration: const InputDecoration(isDense: true),
                      onChanged: (v) =>
                          setState(() => _draft['end_period'] = v),
                    ),
                    const SizedBox(height: 14),
                    _label('Status'),
                    DropdownButtonFormField<String>(
                      initialValue: _draft['status'] as String?,
                      items: const ['Open', 'WIP', 'Done', 'Blocked']
                          .map((o) =>
                              DropdownMenuItem(value: o, child: Text(o)))
                          .toList(),
                      decoration: const InputDecoration(isDense: true),
                      onChanged: (v) => setState(() => _draft['status'] = v),
                    ),
                    if (_error != null) ...[
                      const SizedBox(height: 12),
                      Text(_error!,
                          style: const TextStyle(color: AppColors.accent)),
                    ],
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.kit.color,
                        ),
                        icon: const Icon(Icons.check_rounded),
                        label: Text(widget.initial == null ? 'Add' : 'Save'),
                        onPressed: () {
                          final t = (_draft['title'] as String? ?? '').trim();
                          if (t.isEmpty) {
                            setState(() => _error = 'Title is required');
                            return;
                          }
                          widget.onSave(_draft);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String s) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          s,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      );
}
