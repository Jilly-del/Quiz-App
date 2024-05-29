import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart  ';
import './question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.restart});
  final List<String> choosenAnswer;
  final void Function() restart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final numTotalQues = questions.length;
    final numCorrectAns = summarydata
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Out of $numTotalQues You have answered $numCorrectAns correctly ',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 251),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 16,
                ),
              ),
              icon: const Icon(Icons.restart_alt_sharp),
              label: const Text(
                'Restart Quiz',
              ),
            )
          ],
        ),
      ),
    );
  }
}
