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
      activeScreen = 'question';
    });
  }

  void addAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results';
        selectedAnswer = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    if (activeScreen == 'home') {
      page = HomePage(switchScreen);
    } else if (activeScreen == 'question') {
      page = QuestionScreen(addAnswer: addAnswer);
    } else {
      page = ResultScreen();
    }
    Widget screenWidget = page;
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
