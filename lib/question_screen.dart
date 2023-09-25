import 'package:dice/answer_button.dart';
import 'package:dice/data/questions.dart';
import 'package:dice/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer });

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() => _QuestionScreen();
}

class _QuestionScreen extends State<QuestionScreen> {
  int currentQuizIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    //currentQuizIndex = currentQuizIndex +1; <- 이거 아래꺼랑 똑같은거야.
    // currentQuizIndex +=1;   <- 이건 또 아래거랑 똑같은거임.. 근데 아래꺼는 오직 1씩만 증가할떄 씀
    setState(() {
      currentQuizIndex++;
    });
  }

  //여기 final 할 것을 QuizQuestion 함 해봤음

  @override
  Widget build(context) {
    QuizQuestions currentQuestion = questions[currentQuizIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.aBeeZee(
                  fontSize: 24.0,
                  color: const Color.fromARGB(255, 243, 164, 164),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            ...currentQuestion.getAnswerShuffled().map((item) {
              return AnswerButton(
                answerText: item,
                onTab: (){
                  answerQuestion(item);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
