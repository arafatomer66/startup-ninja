import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../app/theme.dart';
import '../../../data/models/section_model.dart';

class FieldInput extends StatelessWidget {
  final FieldDef field;
  final dynamic value;
  final ValueChanged<dynamic> onChanged;
  final Color accent;

  const FieldInput({
    super.key,
    required this.field,
    required this.value,
    required this.onChanged,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field.label + (field.required ? ' *' : ''),
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        _buildInput(context),
      ],
    );
  }

  Widget _buildInput(BuildContext context) {
    switch (field.type) {
      case FieldType.text:
        return _textField(maxLines: 1);
      case FieldType.longText:
        return _textField(maxLines: 4);
      case FieldType.number:
        return _textField(
          maxLines: 1,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.\-]'))],
        );
      case FieldType.currency:
        return _textField(
          maxLines: 1,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          prefix: field.unit ?? 'BDT',
        );
      case FieldType.percent:
        return _textField(
          maxLines: 1,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          suffix: '%',
        );
      case FieldType.date:
        return _dateField(context);
      case FieldType.dropdown:
        return _dropdownField();
      case FieldType.multiSelect:
        return _multiSelectField();
      case FieldType.checkbox:
        return _checkboxField();
      case FieldType.raciSelect:
        return _raciField();
      case FieldType.rating:
        return _ratingField();
    }
  }

  Widget _textField({
    required int maxLines,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? prefix,
    String? suffix,
  }) {
    return TextFormField(
      initialValue: value?.toString() ?? '',
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: field.placeholder,
        prefixText: prefix == null ? null : '$prefix  ',
        suffixText: suffix,
        isDense: true,
      ),
    );
  }

  Widget _dateField(BuildContext context) {
    final dt = value is String && (value as String).isNotEmpty
        ? DateTime.tryParse(value as String)
        : null;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: dt ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) onChanged(picked.toIso8601String());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today_rounded, size: 16, color: accent),
            const SizedBox(width: 10),
            Text(
              dt == null
                  ? (field.placeholder ?? 'Select date')
                  : '${dt.year}-${dt.month.toString().padLeft(2, "0")}-${dt.day.toString().padLeft(2, "0")}',
              style: TextStyle(
                fontSize: 14,
                color: dt == null ? AppColors.textHint : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropdownField() {
    return DropdownButtonFormField<String>(
      initialValue: value as String?,
      isExpanded: true,
      decoration: const InputDecoration(isDense: true),
      items: (field.options ?? [])
          .map((o) => DropdownMenuItem(value: o, child: Text(o)))
          .toList(),
      onChanged: (v) => onChanged(v),
    );
  }

  Widget _multiSelectField() {
    final selected =
        (value is List) ? (value as List).cast<String>().toSet() : <String>{};
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: (field.options ?? []).map((o) {
        final on = selected.contains(o);
        return GestureDetector(
          onTap: () {
            final next = Set<String>.from(selected);
            on ? next.remove(o) : next.add(o);
            onChanged(next.toList());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: on ? accent.withValues(alpha: 0.12) : AppColors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: on ? accent : AppColors.border,
              ),
            ),
            child: Text(
              o,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: on ? accent : AppColors.textSecondary,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _checkboxField() {
    final on = value == true;
    return GestureDetector(
      onTap: () => onChanged(!on),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: on ? accent.withValues(alpha: 0.08) : AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: on ? accent : AppColors.border),
        ),
        child: Row(
          children: [
            Icon(
              on
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_rounded,
              color: on ? accent : AppColors.textHint,
              size: 22,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                field.placeholder ?? 'Yes',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: on ? accent : AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _raciField() {
    const opts = ['R', 'A', 'C', 'I', '—'];
    return Wrap(
      spacing: 6,
      children: opts.map((o) {
        final on = value == o || (value == null && o == '—');
        return GestureDetector(
          onTap: () => onChanged(o == '—' ? null : o),
          child: Container(
            width: 44,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: on ? accent : AppColors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: on ? accent : AppColors.border),
            ),
            child: Text(
              o,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: on ? Colors.white : AppColors.textSecondary,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _ratingField() {
    final v = (value is num) ? (value as num).toInt() : 0;
    return Row(
      children: List.generate(5, (i) {
        final filled = i < v;
        return GestureDetector(
          onTap: () => onChanged(i + 1),
          child: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Icon(
              filled ? Icons.star_rounded : Icons.star_border_rounded,
              color: filled ? accent : AppColors.textHint,
              size: 28,
            ),
          ),
        );
      }),
    );
  }
}
