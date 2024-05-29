import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {required this.answerText, required this.ontap, super.key});
  final String answerText;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          backgroundColor: const Color.fromARGB(225, 33, 1, 95),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: ontap,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
