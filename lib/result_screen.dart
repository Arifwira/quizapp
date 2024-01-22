import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/question_summary.dart';

import 'dart:developer' as developer;
import 'data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswer, required this.switchScreen});

  final void Function() switchScreen;

  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'choosenAnswer': choosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummaryData();
    var answerData = questions.length;
    var correctAnswer = summaryData.where((data) => data['correct_answer']==data['choosenAnswer']).length;

    developer.log(getSummaryData().toString(), name: 'INI COBA');
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(style: GoogleFonts.lato(
                 color: const Color.fromARGB(255, 255, 255, 255),
                 fontSize: 20,
                 fontWeight: FontWeight.bold),
                 textAlign: TextAlign.center,
                 'Kamu menjawab $correctAnswer dari $answerData soal dengan benar!'),
            const SizedBox(height: 40),
            QuestSummary(summaryData: summaryData),
            const SizedBox(height: 40),
            TextButton.icon(onPressed: switchScreen, icon: const Icon(CupertinoIcons.restart,color: Colors.white),
            label: Text(style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                        fontWeight: FontWeight.bold),
                'Restart Kuis')),
          ],
        ),
      ),
    );
  }
}
