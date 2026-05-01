import '../models/section_model.dart';
import 'formation_sections.dart';
import 'hr_sections.dart';
import 'sop_sections.dart';
import 'product_sections.dart';
import 'procurement_sections.dart';
import 'business_sections.dart';
import 'finance_sections.dart';

List<SectionModel> sectionsForKit(String kitId) {
  switch (kitId) {
    case 'formation':
      return formationSections;
    case 'hr':
      return hrSections;
    case 'sop':
      return sopSections;
    case 'product':
      return productSections;
    case 'procurement':
      return procurementSections;
    case 'business':
      return businessSections;
    case 'finance':
      return financeSections;
    default:
      return const [];
  }
}
