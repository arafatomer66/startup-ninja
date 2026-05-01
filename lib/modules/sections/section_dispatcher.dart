import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/kit_model.dart';
import '../../data/models/section_model.dart';
import 'record_list_screen.dart';
import 'single_form_screen.dart';
import 'checklist_screen.dart';
import 'sop_process_screen.dart';
import 'raci_matrix_screen.dart';
import 'financial_grid_screen.dart';
import 'roadmap_screen.dart';

class SectionDispatcher extends StatelessWidget {
  const SectionDispatcher({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final kit = args['kit'] as KitModel;
    final section = args['section'] as SectionModel;

    switch (section.pattern) {
      case SectionPattern.recordList:
      case SectionPattern.catalog:
        return RecordListScreen(kit: kit, section: section);
      case SectionPattern.singleForm:
        return SingleFormScreen(kit: kit, section: section);
      case SectionPattern.checklist:
        return ChecklistScreen(kit: kit, section: section);
      case SectionPattern.sopProcess:
        return SopProcessScreen(kit: kit, section: section);
      case SectionPattern.raciMatrix:
        return RaciMatrixScreen(kit: kit, section: section);
      case SectionPattern.financialGrid:
        return FinancialGridScreen(kit: kit, section: section);
      case SectionPattern.roadmap:
        return RoadmapScreen(kit: kit, section: section);
    }
  }
}
