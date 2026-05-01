import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/routes.dart';
import '../../app/theme.dart';
import '../../data/providers/progress_provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  final _nameController = TextEditingController();
  int _currentPage = 0;

  static const _pages = [
    _OnboardingData(
      gradient: [Color(0xFF5B4FE8), Color(0xFF8B7FF0)],
      icon: Icons.bolt_rounded,
      title: 'Welcome to\nStartupNinja',
      subtitle:
          'Your all-in-one guide to building a startup — with structured kits, lessons, and quizzes built from real frameworks.',
      tag: 'START HERE',
    ),
    _OnboardingData(
      gradient: [Color(0xFF00C48C), Color(0xFF00E5A8)],
      icon: Icons.layers_rounded,
      title: '7 Kits.\nAll You Need.',
      subtitle:
          'Formation, HR, SOPs, Product, Procurement, Business & Finance — every function covered in bite-sized, actionable lessons.',
      tag: '39 LESSONS',
    ),
    _OnboardingData(
      gradient: [Color(0xFFFF5C7A), Color(0xFFFF8FA3)],
      icon: Icons.emoji_events_rounded,
      title: 'Learn. Apply.\nLevel Up.',
      subtitle:
          'Track progress through each kit, test yourself with quizzes, and apply real startup templates to your business.',
      tag: 'TRACK PROGRESS',
    ),
  ];

  void _next() {
    if (_currentPage < _pages.length) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _finish() {
    final name = _nameController.text.trim();
    final provider = Get.find<ProgressProvider>();
    if (name.isNotEmpty) provider.setUserName(name);
    provider.setOnboarded();
    Get.offAllNamed(Routes.home);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        onPageChanged: (i) => setState(() => _currentPage = i),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ..._pages.map((p) => _buildPage(p)),
          _buildNamePage(),
        ],
      ),
    );
  }

  Widget _buildPage(_OnboardingData page) {
    return Column(
      children: [
        // Top illustration area
        Container(
          height: MediaQuery.of(context).size.height * 0.48,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: page.gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -40,
                right: -40,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
              ),
              Positioned(
                bottom: -60,
                left: -60,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
              ),
              SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.3),
                              width: 1.5),
                        ),
                        child:
                            Icon(page.icon, size: 52, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          page.tag,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Content area
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 32, 28, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  page.title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                    height: 1.2,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  page.subtitle,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.textSecondary,
                    height: 1.65,
                  ),
                ),
                const Spacer(),
                _buildDots(),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _next,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: page.gradient[0],
                    ),
                    child: const Text('Continue'),
                  ),
                ),
                const SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNamePage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.42,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppGradients.hero,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -40,
                  right: -40,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                ),
                SafeArea(
                  child: Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 1.5),
                      ),
                      child: const Icon(Icons.person_rounded,
                          size: 52, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 32, 28, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What should\nwe call you?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                    height: 1.2,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "We'll personalize your experience.",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                    prefixIcon: Icon(Icons.person_outline_rounded,
                        color: AppColors.textSecondary),
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _finish,
                    child: const Text("Let's Go!"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDots() {
    final total = _pages.length + 1;
    return Row(
      children: List.generate(total, (i) {
        final active = _currentPage == i;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(right: 6),
          width: active ? 22 : 7,
          height: 7,
          decoration: BoxDecoration(
            color: active ? AppColors.primary : AppColors.border,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class _OnboardingData {
  final List<Color> gradient;
  final IconData icon;
  final String title;
  final String subtitle;
  final String tag;

  const _OnboardingData({
    required this.gradient,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.tag,
  });
}
