import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  //퀘스쳔서머리에서 받는 데이터는 Map List

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (item) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: item['selectedAnswer'] == item['correctAnswer']
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: Text(
                            ((item['questionIndex'] as int) + 1).toString()),
                      )),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['questionText'].toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        item['selectedAnswer'].toString(),
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                      Text(
                        item['correctAnswer'] as String,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
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

//
// 'questionIndex': i,
// 'questionText': questions[i].text,
// 'selectedAnswer': chosenAnswer[i],
// 'correctAnswer': questions[i].answers[0],
