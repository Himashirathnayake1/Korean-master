import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:korean_master/models/lesson.dart';
import 'package:korean_master/screens/words_screen.dart';
import 'package:korean_master/themes/app_theme.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;

  const LessonCard({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE7D3FF)),

        boxShadow: [
          BoxShadow(
            color: const Color(0x14000000), // #00000014
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          // Navigate to lesson details
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WordsScreen(lesson: lesson),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            // Main content row (circle, titles, status)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lesson number circle
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFEFE6FF),
                  ),
                  child: Center(child: Text(lesson.id, style: AppTheme.idText)),
                ),

                const SizedBox(width: 14),

                // Lesson info (title, Korean text only)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Titles
                        Text(
                          lesson.titleTranslated,
                          style: AppTheme.titleSinhala,
                        ),
                        const SizedBox(height: 5),
                        Text(lesson.titleKorean, style: AppTheme.cardSubtitle),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Status indicator
                _buildStatusIndicator(),
              ],
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    '${lesson.wordCount} words',
                    style: AppTheme.cardSubtitle2,
                  ),
                  const SizedBox(width: 35),
                  Container(
                    width: 175,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.39),
                      color: const Color(0xFFE5E7EB),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: lesson.progress,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.39),
                          color: const Color(0xFF22C45D),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator() {
    switch (lesson.status) {
      case LessonStatus.completed:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Completed', style: AppTheme.cardStatus),
              const SizedBox(width: 9),

              SvgPicture.asset(
                'assets/images/check.svg',
                height: 25,
                width: 25,
              ),
            ],
          ),
        );

      case LessonStatus.inProgress:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'In progress',
              style: AppTheme.cardStatus.copyWith(
                color: const Color(0xFF727272),
              ),
            ),
            const SizedBox(width: 9),
            SvgPicture.asset(
              'assets/icons/right_arrow.svg',
              height: 25,
              width: 25,
            ),
          ],
        );

      case LessonStatus.notStarted:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/right_arrow.svg',
              height: 25,
              width: 25,
            ),
          ],
        );
    }
  }
}
