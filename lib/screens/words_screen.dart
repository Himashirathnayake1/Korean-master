import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:korean_master/models/lesson.dart';
import 'package:korean_master/models/word.dart';
import 'package:korean_master/themes/app_theme.dart';

class WordsScreen extends StatefulWidget {
  final Lesson lesson;

  const WordsScreen({super.key, required this.lesson});

  @override
  State<WordsScreen> createState() => _WordsScreenState();
}

class _WordsScreenState extends State<WordsScreen> {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Word> words = _generateWordsForLesson(widget.lesson.id);

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
                    const SizedBox(height: 35),

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
                          widget.lesson.titleTranslated,
                          style: AppTheme.apparTitleSinhala,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 7),
                        Text(
                          widget.lesson.titleKorean,
                          style: AppTheme.apparKorean,
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

                    const SizedBox(height: 16),

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
                                  width: 261 * widget.lesson.progress,
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
                            '${(widget.lesson.progress * 100).toInt()}% Learned',
                            style: AppTheme.bodyMedium
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
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF4B2C91),Color(0xFFB57CFF)],
              ),
            ),
            child: SafeArea(
              top: false,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PRACTICE NOW',
                        style: AppTheme.idText.copyWith(fontSize: 21,color: Colors.white),
                      ),
                      const SizedBox(width: 10),
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
        border: Border.all(color: Color(0xFFE7D3FF), width: 1),
        boxShadow: [
          BoxShadow(
        color: const Color(0x14000000),
        blurRadius: 20,
        offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Audio icon  not work
          SvgPicture.asset('assets/icons/speak.png'),

          const SizedBox(width: 16),

          // Word texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word.korean,
                  style: AppTheme.normalKoreanText,
                ),
                const SizedBox(height: 10),
                Text(
                  word.sinhala,
                  style: AppTheme.normalSinhalaText,
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
