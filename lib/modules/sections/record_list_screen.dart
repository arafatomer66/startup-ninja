import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../data/models/kit_model.dart';
import '../../data/models/section_model.dart';
import '../../data/providers/section_data_provider.dart';
import '../../widgets/responsive.dart';
import 'widgets/field_input.dart';

class RecordListScreen extends StatelessWidget {
  final KitModel kit;
  final SectionModel section;
  const RecordListScreen({super.key, required this.kit, required this.section});

  @override
  Widget build(BuildContext context) {
    final data = Get.find<SectionDataProvider>();

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
        // Subscribe to changes by reading first
        final records = data.getRecords(section.id);

        return ResponsiveContent(
          child: Column(
            children: [
              if (section.helpText != null) _HelpBanner(
                  text: section.helpText!, color: kit.color),
              Expanded(
                child: records.isEmpty
                    ? _EmptyState(kit: kit, section: section)
                    : ListView.builder(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
                        itemCount: records.length,
                        itemBuilder: (_, i) => _RecordCard(
                          kit: kit,
                          section: section,
                          record: records[i],
                          index: i,
                          onTap: () => _openEditor(context, data, i, records[i]),
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
        label: const Text('Add Entry',
            style: TextStyle(fontWeight: FontWeight.w700)),
        onPressed: () => _openEditor(context, data, null, null),
      ),
    );
  }

  void _openEditor(BuildContext context, SectionDataProvider data, int? index,
      Map<String, dynamic>? existing) {
    Get.bottomSheet(
      _RecordEditor(
        kit: kit,
        section: section,
        initial: existing,
        onSave: (record) {
          if (index == null) {
            data.addRecord(section.id, record);
          } else {
            data.updateRecord(section.id, index, record);
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

class _HelpBanner extends StatelessWidget {
  final String text;
  final Color color;
  const _HelpBanner({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 14, 20, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_rounded, color: color, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textPrimary,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final KitModel kit;
  final SectionModel section;
  const _EmptyState({required this.kit, required this.section});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
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
              child: Icon(Icons.inbox_rounded, color: kit.color, size: 36),
            ),
            const SizedBox(height: 18),
            const Text(
              'No entries yet',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Tap "Add Entry" to start tracking your ${section.title.toLowerCase()}.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecordCard extends StatelessWidget {
  final KitModel kit;
  final SectionModel section;
  final Map<String, dynamic> record;
  final int index;
  final VoidCallback onTap;

  const _RecordCard({
    required this.kit,
    required this.section,
    required this.record,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fields = section.fields;
    final primaryField = fields.isNotEmpty ? fields.first : null;
    final primaryValue =
        primaryField == null ? null : record[primaryField.key]?.toString();

    final secondary = fields.skip(1).take(3).where((f) {
      final v = record[f.key];
      return v != null && v.toString().isNotEmpty;
    }).toList();

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
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kit.color.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: kit.color,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (primaryValue == null || primaryValue.isEmpty)
                        ? 'Untitled'
                        : primaryValue,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (secondary.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      secondary
                          .map((f) => '${f.label}: ${record[f.key]}')
                          .join(' · '),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded,
                color: AppColors.textHint, size: 20),
          ],
        ),
      ),
    );
  }
}

class _RecordEditor extends StatefulWidget {
  final KitModel kit;
  final SectionModel section;
  final Map<String, dynamic>? initial;
  final ValueChanged<Map<String, dynamic>> onSave;
  final VoidCallback? onDelete;

  const _RecordEditor({
    required this.kit,
    required this.section,
    required this.initial,
    required this.onSave,
    required this.onDelete,
  });

  @override
  State<_RecordEditor> createState() => _RecordEditorState();
}

class _RecordEditorState extends State<_RecordEditor> {
  late Map<String, dynamic> _draft;
  String? _error;

  @override
  void initState() {
    super.initState();
    _draft = widget.initial == null
        ? <String, dynamic>{
            for (final f in widget.section.fields)
              if (f.defaultValue != null) f.key: f.defaultValue,
          }
        : Map<String, dynamic>.from(widget.initial!);
  }

  bool _validate() {
    for (final f in widget.section.fields) {
      if (f.required) {
        final v = _draft[f.key];
        if (v == null || v.toString().trim().isEmpty) {
          setState(() => _error = '${f.label} is required');
          return false;
        }
      }
    }
    setState(() => _error = null);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.initial != null;
    final mq = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
      child: Container(
        constraints: BoxConstraints(maxHeight: mq.size.height * 0.92),
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle + header
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 4,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      isEdit ? 'Edit Entry' : 'New ${widget.section.title}',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                  if (widget.onDelete != null)
                    IconButton(
                      icon: const Icon(Icons.delete_outline_rounded,
                          color: AppColors.accent),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Delete entry?'),
                            content: const Text(
                                'This will remove the record permanently.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  widget.onDelete!();
                                },
                                child: const Text('Delete',
                                    style: TextStyle(color: AppColors.accent)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.border),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final f in widget.section.fields) ...[
                      FieldInput(
                        field: f,
                        value: _draft[f.key],
                        accent: widget.kit.color,
                        onChanged: (v) => setState(() {
                          if (v == null ||
                              (v is String && v.isEmpty) ||
                              (v is List && v.isEmpty)) {
                            _draft.remove(f.key);
                          } else {
                            _draft[f.key] = v;
                          }
                        }),
                      ),
                      const SizedBox(height: 14),
                    ],
                    if (_error != null) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.accent.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.error_outline_rounded,
                                color: AppColors.accent, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _error!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.accent,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.kit.color,
                        ),
                        icon: const Icon(Icons.check_rounded, size: 18),
                        label: Text(isEdit ? 'Save Changes' : 'Add Entry'),
                        onPressed: () {
                          if (_validate()) widget.onSave(_draft);
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
}
