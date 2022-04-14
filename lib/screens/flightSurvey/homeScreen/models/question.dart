class Question {
  final String questionNumber;
  final String question;
  final String option1;
  final String option2;
  final String option3;

  Question({
    required this.questionNumber,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
  });
}

List<Question> questions = [
  Question(
    questionNumber: "01",
    question: "How many hours in your average flight?",
    option1: "Less than two hours",
    option2: "More than two but less than five hours",
    option3: "Others",
  ),
  Question(
    questionNumber: "02",
    question: "How was your last flight travel?",
    option1: "Awesome",
    option2: "Good",
    option3: "Not So Good",
  ),
];
