import 'package:flutter/material.dart';
import './answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectAnswer});
  final void Function(String name) onSelectAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var currentquestionindex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[currentquestionindex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                currentquestion.question,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 201, 153, 251),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ...currentquestion.getShufflledAnswer().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  ontap: () {
                    answerQuestion(answer);
                  });
            })
          ],
        ),
      ),
    );
  }
}
