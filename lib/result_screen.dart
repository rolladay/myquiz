import 'package:dice/data/questions.dart';
import 'package:dice/question_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAnswer, required this.restart});

  final List<String> chosenAnswer;
  void Function() restart;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'questionIndex': i,
        'questionText': questions[i].text,
        'selectedAnswer': chosenAnswer[i],
        'correctAnswer': questions[i].answers[0],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    // 굳이 변수에 저장해두는 이유는, 매번 불러와서 겟서머리하는것보다 이 메소드를 담아두고 불러다 쓰는게 효율적이라

    final int numOfTotalQuestion = questions.length;
    final int numOfCorrctAnswer = summaryData.where((element) {
      return element['selectedAnswer'] == element['correctAnswer'];
    }).length;
    //여기서의 element는 map이나 list의 항목 하나하나를 칭한당

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'You got $numOfCorrctAnswer correctanswers of $numOfTotalQuestion answers!',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
          const SizedBox(height: 60.0),
          QuestionsSummary(
            summaryData: summaryData,
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.refresh, color: Colors.white),
              TextButton(
                onPressed: restart,
                child: Text('Restart',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
