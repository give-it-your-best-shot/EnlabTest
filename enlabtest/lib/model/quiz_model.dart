class QuizModel {
  String category;
  String type;
  String difficulty;
  String question;
  String correct_answer;
  List<String> incorrect_answers;
  List<String>? allQuiz;
  QuizModel(this.category, this.type, this.difficulty, this.question,
      this.correct_answer, this.incorrect_answers) {
    allQuiz = [];
    allQuiz!.add(correct_answer);
    allQuiz!.addAll(incorrect_answers);
    allQuiz!.shuffle();
  }

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
        json["category"],
        json["type"],
        json["difficulty"],
        json["question"],
        json["correct_answer"],
        json["incorrect_answers"].map<String>((e) => e.toString()).toList());
  }

  Map<String, dynamic> toJson({int depth = 0}) => {
        "category": category,
        "type": type,
        "difficulty": difficulty,
        "question": question,
        "correct_answer": correct_answer,
        "incorrect_answers": incorrect_answers
      };

  @override
  String toString() => toJson().toString();
}
