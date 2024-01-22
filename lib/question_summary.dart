import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestSummary extends StatelessWidget {
  const QuestSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    var boxColor = Colors.red;
    // TODO: implement build
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: data['correct_answer'] == data['choosenAnswer']
                              ? Colors.lightBlueAccent
                              : const Color.fromARGB(255, 255, 68, 182),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Text(
                          style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 12, 24, 74),
                              fontSize: 16,
                              fontWeight: FontWeight.w900),
                          ((data['question_index'] as int) + 1).toString())),
                  const SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            (data['question']).toString()),
                        Text(style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 146, 234, 255),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),(data['correct_answer']).toString()),
                        Text(style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 255, 159, 219),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),(data['choosenAnswer']).toString()),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
