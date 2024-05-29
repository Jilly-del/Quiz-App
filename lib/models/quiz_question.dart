class QuizQuestion {
  QuizQuestion(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> getShufflledAnswer() {
    final shullfedList = List.of(answers);
    shullfedList.shuffle();
    return shullfedList;
  }
}
