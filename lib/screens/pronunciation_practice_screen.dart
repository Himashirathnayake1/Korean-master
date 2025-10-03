import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:korean_master/models/lesson.dart';
import 'package:korean_master/models/word.dart';
import 'package:korean_master/themes/app_theme.dart';

class PronunciationPracticeScreen extends StatefulWidget {
  final Lesson lesson;

  const PronunciationPracticeScreen({super.key, required this.lesson});

  @override
  State<PronunciationPracticeScreen> createState() =>
      _PronunciationPracticeScreenState();
}

class _PronunciationPracticeScreenState
    extends State<PronunciationPracticeScreen> {
  int _currentWordIndex = 0;
  late List<Word> _words;

  @override
  void initState() {
    super.initState();
    _words = _generateWordsForLesson(widget.lesson.id);
  }

  @override
  Widget build(BuildContext context) {
    final currentWord = _words[_currentWordIndex];
    final totalWords = _words.length;
    final progress = (_currentWordIndex + 1) / totalWords;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Color(0xFF7F4BF7),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Expanded(
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey[300],
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width *
                                      progress *
                                      0.8,
                                  height: 9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: const Color(0xFF22C45D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Instruction text
                  Text(
                    'පහත වචන කියවා හොඳින් මතක තබා ගන්න',
                    style: AppTheme.normalSinhalaText,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  // Progress box
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7F4BF7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${_currentWordIndex + 1}/$totalWords',
                      style: AppTheme.bodyNumbers,
                    ),
                  ),
                ],
              ),
            ),

            // Word card
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF8E62FF),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                          color: const Color(0x14000000),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [_buildProgressIcon(currentWord.status)],
                          ),

                          const SizedBox(height: 16),

                          // Word illustration
                          _buildWordImage(currentWord.korean),

                          const SizedBox(height: 30),

                          // Korean word
                          Text(
                            currentWord.korean,
                            style: AppTheme.normalKoreanText,
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 8),

                          // Pronunciation
                          Text(
                            _getPronunciation(currentWord.korean),
                            style: AppTheme.normalEnglishText,
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 8),

                          // Sinhala translation
                          Text(
                            currentWord.sinhala,
                            style: AppTheme.normalSinhalaText,
                             
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 30),

                          // Audio button
                          GestureDetector(
                            onTap: () {
                             
                            },
                            child: Container(
                             
                              child: SvgPicture.asset(
                                'assets/icons/group.svg',
                                height: 30,
                                width: 30,
                              
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentWordIndex < _words.length - 1) {
                      setState(() {
                        _currentWordIndex++;
                      });
                    } else {
                      // later
                    
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7F4BF7),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    _currentWordIndex < _words.length - 1
                        ? 'Next Word'
                        : 'Start Practice',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWordImage(String koreanWord) {
    switch (koreanWord) {
      case '선생님':
        return Container(
          width: 200,
          height: 160,
         
          child: SvgPicture.asset(
            'assets/images/teacher.svg',
            width: 200,
            height: 160,
            fit: BoxFit.contain,
          ),
        );
      case '학생':
        return Container(
          width: 200,
          height: 160,
          child: SvgPicture.asset(
            'assets/images/student.svg',
            width: 200,
            height: 160,
            fit: BoxFit.contain,
          ),
        );
      case '반 친구':
        return Container(
          width: 200,
          height: 160,
          child: SvgPicture.asset(
            'assets/images/friend.svg',
            width: 200,
            height: 160,
            fit: BoxFit.contain,
          ),
        );
      case '질문':
        return Container(
          width: 200,
          height: 160,
          child: SvgPicture.asset(
            'assets/images/question.svg',
            width: 200,
            height: 160,
            fit: BoxFit.contain,
          ),
        );
   
    
      default:
        return Container(
          width: 200,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.text_fields, size: 80, color: Colors.grey),
        );
    }
  }

  Widget _buildProgressIcon(WordStatus status) {
    switch (status) {
      case WordStatus.completed:
         return SvgPicture.asset('assets/icons/check.svg', width: 30,
          height: 30,);
      case WordStatus.inProgressOne:
        return  SvgPicture.asset('assets/icons/1_progress.svg', width: 30,
          height: 30,);

      case WordStatus.inProgressTwo:
        return  SvgPicture.asset('assets/icons/2_progress.svg', width: 30,
          height: 30,);

      case WordStatus.notStarted:
        return  SvgPicture.asset('assets/icons/not_started.svg', width: 30,
          height: 30,);
    }
  }

  String _getPronunciation(String koreanWord) {
    switch (koreanWord) {
      case '선생님':
        return 'seon-saeng-nim';
      case '학생':
        return 'hak-saeng';
      case '반 친구':
        return 'ban chin-gu';
      case '질문':
        return 'chil-pan';
      default:
        return '';
    }
  }


  //get words
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
            korean: '검은색 보드',
            sinhala: 'කළු ලෑල්ල',
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
          const Word(
            korean: '질문',
            sinhala: 'ප්‍රශ්න',
            status: WordStatus.notStarted,
          ),
        ];
    }
  }
}
