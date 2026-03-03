class LessonDetails {
  final int number;
  final String concept;
  final String problem;

  const LessonDetails({
    required this.number,
    required this.concept,
    required this.problem
  });
}

class Lessons {
  static const LessonDetails lessonOne = LessonDetails(
    number: 1, 
    concept: """
  # Header
  This is a **bold** word.

  * Item 1
  * Item 2

  [Visit Google](https://google.com)
  """, 
    problem: """
  # Header
  This is me, MARIO.

  * Item 1
  * Item 2

  [Visit Google](https://google.com)
  """
  );
}


