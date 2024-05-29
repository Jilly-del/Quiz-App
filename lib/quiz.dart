import 'package:flutter/material.dart';
import 'package:quiz_app/result_screen.dart';
import './start_sreen.dart';
import './questions_screen.dart';
import './data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start screen';

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question screen';
    });
  }

  void restartScreen() {
    setState(() {
      activeScreen = 'start screen';
      selectedAnswer = [];
    });
  }

  List<String> selectedAnswer = [];

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetScreen = Questions(onSelectAnswer: chooseAnswer);
    if (activeScreen == 'result screen') {
      widgetScreen = ResultScreen(
        choosenAnswer: selectedAnswer,
        restart: restartScreen,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen == 'start screen'
              ? StartScreen(switchScreen)
              : widgetScreen,
        ),
      ),
    );
  }
}
