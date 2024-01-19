class QuizQuestion {
  const QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> getShuffledAnswer() {
    final answerList = List.of(answer);
    answerList.shuffle();
    return answerList;
  }
  //xixixixi//
}
