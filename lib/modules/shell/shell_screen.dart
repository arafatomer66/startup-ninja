import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../blueprint/blueprint_screen.dart';
import '../course/course_screen.dart';
import '../home/home_screen.dart';
import '../modules/modules_screen.dart';
import '../profile/profile_screen.dart';

/// Bottom-nav shell. Tabs keep their state via IndexedStack; detail
/// screens (week, lesson, tracker, kit) push on top as full routes.
class ShellController extends GetxController {
  final tab = 0.obs;

  void setTab(int index) => tab.value = index;
}

class ShellScreen extends StatelessWidget {
  const ShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShellController(), permanent: true);

    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.background,
        body: IndexedStack(
          index: controller.tab.value,
          children: const [
            HomeScreen(),
            CourseScreen(),
            ModulesScreen(),
            BlueprintScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: _NavBar(controller: controller),
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  final ShellController controller;

  const _NavBar({required this.controller});

  static const _items = [
    (icon: Icons.home_rounded, label: 'Home'),
    (icon: Icons.school_rounded, label: 'Course'),
    (icon: Icons.layers_rounded, label: 'Kits'),
    (icon: Icons.description_rounded, label: 'Blueprint'),
    (icon: Icons.person_rounded, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
        boxShadow: [
          BoxShadow(
            color: Color(0x0A0F0A2C),
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              for (var i = 0; i < _items.length; i++)
                Expanded(
                  child: _NavItem(
                    icon: _items[i].icon,
                    label: _items[i].label,
                    active: controller.tab.value == i,
                    onTap: () => controller.setTab(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: active ? AppColors.primaryLight : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                size: 22,
                color: active ? AppColors.primary : AppColors.textHint,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: active ? FontWeight.w800 : FontWeight.w600,
                letterSpacing: 0.1,
                color: active ? AppColors.primary : AppColors.textHint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
