enum SectionPattern {
  recordList,
  checklist,
  raciMatrix,
  sopProcess,
  financialGrid,
  catalog,
  singleForm,
  roadmap,
}

enum FieldType {
  text,
  longText,
  number,
  currency,
  percent,
  date,
  dropdown,
  multiSelect,
  checkbox,
  raciSelect,
  rating,
}

class FieldDef {
  final String key;
  final String label;
  final FieldType type;
  final List<String>? options;
  final String? unit;
  final String? formula;
  final bool required;
  final dynamic defaultValue;
  final String? placeholder;

  const FieldDef({
    required this.key,
    required this.label,
    required this.type,
    this.options,
    this.unit,
    this.formula,
    this.required = false,
    this.defaultValue,
    this.placeholder,
  });
}

class SectionModel {
  final String id;
  final String kitId;
  final String title;
  final String? subtitle;
  final String? subGroup;
  final SectionPattern pattern;
  final List<FieldDef> fields;
  final List<FieldDef>? rowAxis;
  final List<String>? colAxis;
  final List<Map<String, dynamic>>? seedRows;
  final String? helpText;

  const SectionModel({
    required this.id,
    required this.kitId,
    required this.title,
    this.subtitle,
    this.subGroup,
    required this.pattern,
    this.fields = const [],
    this.rowAxis,
    this.colAxis,
    this.seedRows,
    this.helpText,
  });
}
