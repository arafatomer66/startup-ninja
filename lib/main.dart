import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/theme.dart';
import 'app/routes.dart';
import 'data/providers/progress_provider.dart';
import 'data/providers/section_data_provider.dart';
import 'data/services/blueprint_aggregator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(ProgressProvider());
  Get.put(SectionDataProvider());
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
