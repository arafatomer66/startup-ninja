import 'package:get/get.dart';
import '../modules/splash/splash_screen.dart';
import '../modules/onboarding/onboarding_screen.dart';
import '../modules/home/home_screen.dart';
import '../modules/modules/modules_screen.dart';
import '../modules/modules/module_detail_screen.dart';
import '../modules/quiz/quiz_screen.dart';
import '../modules/profile/profile_screen.dart';
import '../modules/sections/section_dispatcher.dart';
import '../modules/blueprint/blueprint_screen.dart';

abstract class Routes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const modules = '/modules';
  static const moduleDetail = '/module-detail';
  static const quiz = '/quiz';
  static const profile = '/profile';
  static const section = '/section';
  static const blueprint = '/blueprint';
}

final appPages = [
  GetPage(name: Routes.splash, page: () => const SplashScreen()),
  GetPage(name: Routes.onboarding, page: () => const OnboardingScreen()),
  GetPage(name: Routes.home, page: () => const HomeScreen()),
  GetPage(name: Routes.modules, page: () => const ModulesScreen()),
  GetPage(name: Routes.moduleDetail, page: () => const ModuleDetailScreen()),
  GetPage(name: Routes.quiz, page: () => const QuizScreen()),
  GetPage(name: Routes.profile, page: () => const ProfileScreen()),
  GetPage(name: Routes.section, page: () => const SectionDispatcher()),
  GetPage(name: Routes.blueprint, page: () => const BlueprintScreen()),
];
