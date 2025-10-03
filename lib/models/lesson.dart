enum LessonStatus { notStarted, inProgress, completed }

class Lesson {
  final String id;
  final String titleKorean;
  final String titleTranslated;
  final int wordCount;
  final double progress; // 0.0 to 1.0
  final LessonStatus status;

  const Lesson({
    required this.id,
    required this.titleKorean,
    required this.titleTranslated,
    required this.wordCount,
    required this.progress,
    required this.status,
  });
}
