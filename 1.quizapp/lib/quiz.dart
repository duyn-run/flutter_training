import 'package:flutter/material.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen =  StartScreen(switchScreen);
  // }
  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionsScreen();
  //   });
  // }

  var activeScreen = 'start-screen';
  List<String> answersList = [];
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void addAnswer(String answer) {
    answersList.add(answer);

    if (answersList.length == questions.length) {
      setState(() {
        // answersList = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
        answersList = [];
        activeScreen = 'question-screen';
      });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(
        onAnswerQuestion: addAnswer,
      );
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        answersList: answersList,
        restartQuiz: restartQuiz,
      );
    }

    // final screenWidget = activeScreen == 'start-screen' ? StartScreen(switchScreen) : const QuestionsScreen();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 101, 48, 192),
              Color.fromARGB(255, 129, 73, 226),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
