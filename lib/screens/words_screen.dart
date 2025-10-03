import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:korean_master/models/lesson.dart';
import 'package:korean_master/models/word.dart';

class WordsScreen extends StatelessWidget {
  final Lesson lesson;

  const WordsScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Word> words = _generateWordsForLesson(lesson.id);

    return Scaffold(
      body: Column(
        children: [
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    // Header row with back button and timer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            'assets/images/arrow_left_alt.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const SizedBox(width: 8),
                        Text(
                          lesson.titleTranslated,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 7),
                        Text(
                          lesson.titleKorean,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.history_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Progress bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 261,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[300],
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: 261 * lesson.progress,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFF4CAF50),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '${(lesson.progress * 100).toInt()}% Learned',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Word cards list
          Expanded(
            child: Container(
              color: Colors.grey[50],
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: words.length,
                itemBuilder: (context, index) {
                  return _buildWordCard(words[index]);
                },
              ),
            ),
          ),

          // Practice Now bottom section
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF9558FE), Color(0xFF593598)],
              ),
            ),
            child: SafeArea(
              top: false,
              child: GestureDetector(
                onTap: () {
              
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'PRACTICE NOW',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                         // _showPracticeBottomSheet(context);
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWordCard(Word word) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Audio icon
          SvgPicture.asset('assets/icons/speak.png'),
   
          const SizedBox(width: 16),

          // Word texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word.korean,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  word.sinhala,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Progress icon
          _buildProgressIcon(word.status),
        ],
      ),
    );
  }

  Widget _buildProgressIcon(WordStatus status) {
    switch (status) {
      case WordStatus.completed:
        return SvgPicture.asset('assets/icons/check.svg');
      case WordStatus.inProgressOne:
        return SvgPicture.asset('assets/icons/1_progress.svg');
      case WordStatus.inProgressTwo:
        return SvgPicture.asset('assets/icons/2_progress.svg');
      case WordStatus.notStarted:
        return SvgPicture.asset('assets/icons/note_start.svg');
    }
  }

  List<Word> _generateWordsForLesson(String lessonId) {
    switch (lessonId) {
      case '01':
        return [
          const Word(
            korean: '선생님',
            sinhala: 'ගුරුතුමා',
            status: WordStatus.completed,
          ),
          const Word(
            korean: '학생',
            sinhala: 'ශිෂ්‍යයා',
            status: WordStatus.inProgressOne,
          ),
          const Word(
            korean: '반 친구',
            sinhala: 'පන්තියේ යාලුවා',
            status: WordStatus.inProgressTwo,
          ),
          const Word(
            korean: '질문',
            sinhala: 'කළු ලෆ්ලෙව/ඌයිබි ප්‍රශ්න',
            status: WordStatus.notStarted,
          ),
        ];
      case '02':
        return [
          const Word(
            korean: '직업',
            sinhala: 'රැකියාව',
            status: WordStatus.completed,
          ),
          const Word(
            korean: '회사',
            sinhala: 'සමාගම',
            status: WordStatus.inProgressOne,
          ),
          const Word(
            korean: '사장',
            sinhala: 'ප්‍රධානියා',
            status: WordStatus.notStarted,
          ),
          const Word(
            korean: '동료',
            sinhala: 'සහකරු',
            status: WordStatus.notStarted,
          ),
        ];
      default:
        return [
          const Word(
            korean: '안녕하세요',
            sinhala: 'ආයුබෝවන්',
            status: WordStatus.notStarted,
          ),
          const Word(
            korean: '감사합니다',
            sinhala: 'ස්තූතියි',
            status: WordStatus.notStarted,
          ),
          const Word(
            korean: '죄송합니다',
            sinhala: 'සමාවන්න',
            status: WordStatus.notStarted,
          ),
        ];
    }
  }

 
}
