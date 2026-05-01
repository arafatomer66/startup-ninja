import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme.dart';
import '../../data/models/kit_model.dart';
import '../../data/providers/progress_provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late KitModel kit;
  late LessonModel lesson;
  late List<QuizQuestion> questions;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  int _current = 0;
  int? _selected;
  bool _answered = false;
  int _score = 0;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map;
    kit = args['kit'] as KitModel;
    lesson = args['lesson'] as LessonModel;
    questions = kitQuizzes[kit.id] ?? [];

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _animController.forward();
  }

  void _select(int index) {
    if (_answered) return;
    setState(() {
      _selected = index;
      _answered = true;
      if (index == questions[_current].correctIndex) _score++;
    });
  }

  void _next() {
    if (_current < questions.length - 1) {
      _animController.reset();
      setState(() {
        _current++;
        _selected = null;
        _answered = false;
      });
      _animController.forward();
    } else {
      setState(() => _finished = true);
      Get.find<ProgressProvider>().markLessonComplete(lesson.id);
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(lesson.title)),
        body: const Center(
          child: Text(
            'No questions available yet.',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          '${kit.title} Quiz',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: _finished ? _buildResult() : _buildQuestion(),
    );
  }

  Widget _buildQuestion() {
    final q = questions[_current];
    return FadeTransition(
      opacity: _fadeAnim,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                Text(
                  'Question ${_current + 1} of ${questions.length}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: kit.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Score: $_score',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kit.color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: (_current + 1) / questions.length,
                backgroundColor: kit.color.withValues(alpha: 0.1),
                valueColor: AlwaysStoppedAnimation(kit.color),
                minHeight: 7,
              ),
            ),
            const SizedBox(height: 28),
            // Question card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: AppGradients.forKit(kit.color),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'QUESTION',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    q.question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.45,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Options
            ...List.generate(q.options.length, (i) {
              final isCorrect = i == q.correctIndex;
              final isSelected = i == _selected;

              Color bg = AppColors.surface;
              Color borderColor = AppColors.border;
              Color textColor = AppColors.textPrimary;
              Widget? trailingIcon;

              if (_answered) {
                if (isCorrect) {
                  bg = AppColors.success.withValues(alpha: 0.08);
                  borderColor = AppColors.success;
                  textColor = AppColors.success;
                  trailingIcon = const Icon(Icons.check_circle_rounded,
                      color: AppColors.success, size: 20);
                } else if (isSelected) {
                  bg = AppColors.accent.withValues(alpha: 0.08);
                  borderColor = AppColors.accent;
                  textColor = AppColors.accent;
                  trailingIcon = const Icon(Icons.cancel_rounded,
                      color: AppColors.accent, size: 20);
                }
              } else if (isSelected) {
                bg = kit.color.withValues(alpha: 0.06);
                borderColor = kit.color;
              }

              return GestureDetector(
                onTap: () => _select(i),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: borderColor, width: 1.5),
                    boxShadow: _answered && isCorrect
                        ? [
                            BoxShadow(
                              color: AppColors.success.withValues(alpha: 0.12),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            )
                          ]
                        : null,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: _answered && isCorrect
                              ? AppColors.success.withValues(alpha: 0.15)
                              : _answered && isSelected
                                  ? AppColors.accent.withValues(alpha: 0.15)
                                  : borderColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Center(
                          child: Text(
                            ['A', 'B', 'C', 'D'][i],
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: borderColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          q.options[i],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                            height: 1.4,
                          ),
                        ),
                      ),
                      if (trailingIcon != null) ...[
                        const SizedBox(width: 8),
                        trailingIcon,
                      ],
                    ],
                  ),
                ),
              );
            }),
            // Explanation
            if (_answered) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.2)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.info_rounded,
                          color: AppColors.primary, size: 14),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        q.explanation,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.primary,
                          height: 1.6,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kit.color),
                  onPressed: _next,
                  child: Text(
                    _current < questions.length - 1
                        ? 'Next Question →'
                        : 'See Results',
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildResult() {
    final percent =
        questions.isNotEmpty ? _score / questions.length : 0.0;
    final passed = percent >= 0.6;
    final resultColor = passed ? AppColors.success : AppColors.warning;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
            decoration: BoxDecoration(
              gradient: passed
                  ? const LinearGradient(
                      colors: [Color(0xFF00C48C), Color(0xFF00E5A8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : const LinearGradient(
                      colors: [Color(0xFFFFB547), Color(0xFFFFD280)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
            ),
            child: Column(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.25),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    passed
                        ? Icons.emoji_events_rounded
                        : Icons.school_rounded,
                    color: Colors.white,
                    size: 46,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  passed ? 'Excellent Work!' : 'Keep Going!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  passed
                      ? 'You\'ve mastered this section.'
                      : 'Review the lessons and try again.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Score card
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: AppColors.border),
                    boxShadow: [
                      BoxShadow(
                        color: resultColor.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _ResultStat(
                          label: 'Correct',
                          value: '$_score',
                          color: AppColors.success),
                      Container(
                          width: 1, height: 48, color: AppColors.border),
                      _ResultStat(
                          label: 'Wrong',
                          value: '${questions.length - _score}',
                          color: AppColors.accent),
                      Container(
                          width: 1, height: 48, color: AppColors.border),
                      _ResultStat(
                          label: 'Score',
                          value: '${(percent * 100).toInt()}%',
                          color: resultColor),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kit.color),
                    onPressed: () => Get.back(),
                    child: const Text('Back to Kit'),
                  ),
                ),
                const SizedBox(height: 12),
                if (!passed)
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _current = 0;
                          _selected = null;
                          _answered = false;
                          _score = 0;
                          _finished = false;
                        });
                        _animController.forward();
                      },
                      child: const Text('Try Again'),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ResultStat({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: color,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
