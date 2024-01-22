import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quizapp/question_screen.dart';
import 'package:quizapp/result_screen.dart';
import 'data/questions.dart';
import 'home_screen.dart';
import 'dart:developer' as developer;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'home';

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = HomePage(switchScreen);
  // }

  void switchScreen() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question';
    });
  }

  void addAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomePage(switchScreen);
    if (activeScreen == 'question') {
      screenWidget = QuestionScreen(addAnswer: addAnswer);
    }
    if (activeScreen == 'results'){
      screenWidget =  ResultScreen(choosenAnswer: selectedAnswer, switchScreen: switchScreen);
    }

    developer.log(selectedAnswer.join(" "), name: 'INI COBA');
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.deepPurpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: screenWidget,
        ),
      ),
    );
  }
}
