enum WordStatus { notStarted, inProgressOne, inProgressTwo, completed }

class Word {
  final String korean;
  final String sinhala;
  final WordStatus status;

  const Word({
    required this.korean,
    required this.sinhala,
    required this.status,
  });
}
