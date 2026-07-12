import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/theme.dart';
import 'app/routes.dart';
import 'data/providers/course_progress_provider.dart';
import 'data/providers/progress_provider.dart';
import 'data/providers/section_data_provider.dart';
import 'data/services/blueprint_aggregator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Release builds paint a bare gray box on build errors — swap in a
  // readable card so failures on user devices can actually be reported.
  ErrorWidget.builder = (details) => Material(
        color: const Color(0xFFFFF2F2),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SelectableText(
              'Something went wrong here.\n\n${details.exceptionAsString()}',
              style: const TextStyle(fontSize: 12, color: Color(0xFF7A1F2B)),
            ),
          ),
        ),
      );
  await GetStorage.init();
  Get.put(ProgressProvider());
  Get.put(SectionDataProvider());
  Get.put(CourseProgressProvider());
  Get.put(BlueprintAggregator());
  runApp(const StartupNinjaApp());
}

class StartupNinjaApp extends StatelessWidget {
  const StartupNinjaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'StartupNinja',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: Routes.splash,
      getPages: appPages,
    );
  }
}
