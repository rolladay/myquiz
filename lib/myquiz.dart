import 'package:dice/data/questions.dart';
import 'package:dice/question_screen.dart';
import 'package:dice/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:dice/start_screen.dart';

class MyQuiz extends StatefulWidget {
  const MyQuiz({super.key});

  @override
  State<MyQuiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  String activeScreen = 'startScreen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questionScreen';
    });
  }

  void chooseAnswer(answer) {
    selectedAnswers.add(answer);
    print(selectedAnswers);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'resultScreen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'startstartScreen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = StartScreen(switchScreen: switchScreen);

    if (activeScreen == 'questionScreen') {
      currentScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'resultScreen') {
      currentScreen = ResultScreen(
        chosenAnswer: selectedAnswers,
        restart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.deepPurpleAccent,
                  Colors.blue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: currentScreen),
      ),
    );
  }
}
