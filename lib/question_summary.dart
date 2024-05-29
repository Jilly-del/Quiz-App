import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map(
          (data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 201, 153, 251),
                          ),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 201, 153, 251),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ).toList()),
      ),
    );
  }
}
