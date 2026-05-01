import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../data/models/kit_model.dart';
import '../../data/models/section_model.dart';
import '../../data/providers/section_data_provider.dart';
import '../../widgets/responsive.dart';
import 'widgets/field_input.dart';

class SingleFormScreen extends StatefulWidget {
  final KitModel kit;
  final SectionModel section;
  const SingleFormScreen({super.key, required this.kit, required this.section});

  @override
  State<SingleFormScreen> createState() => _SingleFormScreenState();
}

class _SingleFormScreenState extends State<SingleFormScreen> {
  late SectionDataProvider _data;
  late Map<String, dynamic> _draft;
  String? _error;
  bool _dirty = false;

  @override
  void initState() {
    super.initState();
    _data = Get.find<SectionDataProvider>();
    _draft = Map<String, dynamic>.from(_data.getForm(widget.section.id));
    for (final f in widget.section.fields) {
      if (!_draft.containsKey(f.key) && f.defaultValue != null) {
        _draft[f.key] = f.defaultValue;
      }
    }
  }

  void _save() {
    for (final f in widget.section.fields) {
      if (f.required) {
        final v = _draft[f.key];
        if (v == null || v.toString().trim().isEmpty) {
          setState(() => _error = '${f.label} is required');
          return;
        }
      }
    }
    setState(() {
      _error = null;
      _dirty = false;
    });
    _data.saveForm(widget.section.id, _draft);
    Get.snackbar(
      'Saved',
      '${widget.section.title} has been saved.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: widget.kit.color,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          widget.section.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: ResponsiveContent(
        child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.section.subtitle != null) ...[
              Text(
                widget.section.subtitle!,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 14),
            ],
            if (widget.section.helpText != null) ...[
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: widget.kit.color.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      color: widget.kit.color.withValues(alpha: 0.2)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.lightbulb_rounded,
                        color: widget.kit.color, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.section.helpText!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textPrimary,
                          height: 1.45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
            ],
            for (final f in widget.section.fields) ...[
              FieldInput(
                field: f,
                value: _draft[f.key],
                accent: widget.kit.color,
                onChanged: (v) => setState(() {
                  _dirty = true;
                  if (v == null ||
                      (v is String && v.isEmpty) ||
                      (v is List && v.isEmpty)) {
                    _draft.remove(f.key);
                  } else {
                    _draft[f.key] = v;
                  }
                }),
              ),
              const SizedBox(height: 16),
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
            const SizedBox(height: 6),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _dirty ? widget.kit.color : AppColors.success,
                ),
                icon: Icon(
                  _dirty ? Icons.save_rounded : Icons.check_circle_rounded,
                  size: 18,
                ),
                label: Text(_dirty ? 'Save' : 'Saved'),
                onPressed: _save,
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
