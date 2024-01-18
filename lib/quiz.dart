import 'package:flutter/material.dart';
import 'package:quizapp/question_screen.dart';
import 'home_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
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

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = activeScreen == 'home'
        ? HomePage(switchScreen)
        : const QuestionScreen();

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
