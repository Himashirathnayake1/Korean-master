import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:korean_master/themes/app_theme.dart';
import 'package:korean_master/widgets/eps_topik/book_selection_popup.dart';
import 'package:korean_master/widgets/eps_topik/lesson_card.dart';
import 'package:korean_master/models/lesson.dart';
import 'package:korean_master/widgets/common/custom_bottom_navigation_bar.dart';

class EpsTopikScreen extends StatefulWidget {
  final String selectedBook;
  const EpsTopikScreen({super.key, this.selectedBook = 'EPS Book 01'});

  @override
  State<EpsTopikScreen> createState() => _EpsTopikScreenState();
}

class _EpsTopikScreenState extends State<EpsTopikScreen> {
  int _currentBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Sample lesson data
    final List<Lesson> lessons = [
      Lesson(
        id: '01',
        titleKorean: '직업명',
        titleTranslated: 'පන්ති කාමරය',
        wordCount: 20,
        progress: 1.0,
        status: LessonStatus.completed,
      ),
      Lesson(
        id: '02',
        titleKorean: '직',
        titleTranslated: ' කාමරය',
        wordCount: 40,
        progress: 0.5,
        status: LessonStatus.inProgress,
      ),
      Lesson(
        id: '03',
        titleKorean: '직업명',
        titleTranslated: 'පන්ති කාමරය',
        wordCount: 10,
        progress: 0.0,
        status: LessonStatus.notStarted,
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          // Gradient header
          Container(
            height: screenHeight * 0.23,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF9558FE), Color(0xFF593598)],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: screenHeight * 0.01),

                    // Title and avatar row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('EPS- TopiK', style: AppTheme.titleLarge),
                            const SizedBox(height: 8),
                            // Book title
                            Row(
                              children: [
                                Text(
                                  widget.selectedBook,
                                  style: AppTheme.titleMedium,
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.all(1),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder:
                                            (
                                              BuildContext context,
                                            ) => BookSelectionPopup(
                                              onBookSelected: (bookId) {
                                                // Close the popup
                                                Navigator.of(context).pop();

                                                // Determine book title based on bookId
                                                String bookTitle =
                                                    bookId == 'book01'
                                                        ? 'EPS Book 01'
                                                        : 'EPS Book 02';

                                                // Navigate to EPS Topik screen with selected book
                                                Navigator.of(
                                                  context,
                                                ).pushReplacement(
                                                  MaterialPageRoute(
                                                    builder:
                                                        (context) =>
                                                            EpsTopikScreen(
                                                              selectedBook:
                                                                  bookTitle,
                                                            ),
                                                  ),
                                                );
                                              },
                                            ),
                                      );
                                    },
                                    child: SvgPicture.asset(
                                      'assets/images/select_icon.svg',
                                      width: 18,
                                      height: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Avatar
                        Image.asset(
                          'assets/images/home_logo.png',
                          width: 116,
                          height: 108,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Lesson cards list
          Expanded(
            child: Container(
              color: Colors.grey[50],
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: lessons.length,
                itemBuilder: (context, index) {
                  return LessonCard(lesson: lessons[index]);
                },
              ),
            ),
          ),
        ],
      ),

      // Custom Bottom 
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentBottomNavIndex,
        onTap: (index) {
          setState(() {
            _currentBottomNavIndex = index;
          });

          // Handle navigation based on index
          switch (index) {
            case 0:
              // Words 
              break;
            case 1:
              // Review
             
              break;
            case 2:
              // Profile
              break;
          }
        },
      ),
    );
  }
}
