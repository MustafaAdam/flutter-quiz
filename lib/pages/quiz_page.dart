import 'package:flutter/material.dart';

import 'package:quiz/utils/question.dart';
import 'package:quiz/utils/quiz.dart';

import 'package:quiz/UI/question_text.dart';
import '../UI/answer_button.dart';
import '../UI/correctOrWrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = Quiz([
    Question(question: "Elon Musk is Human?", answer: false),
    Question(question: "Metal Gear is a bad game?", answer: false),
    Question(question: "Stargate Universe was great?", answer: true),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool visibleOverlay = false; // at app start, the overlay will not be show

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.currentQuestionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (answer == currentQuestion.answer);
    quiz.answer(isCorrect);  // to increase user score by one

    setState(() {
      visibleOverlay = true;  // setState rebuilds the UI and reruns the build method
    });
  }

  void onOverlayPress() {
    if(quiz.length == questionNumber) {
      Navigator.of(context).pushNamed('score_page', arguments: ScorePage(quiz.score, quiz.length));
      return; // To stop end the quiz at the score page and not run setState method
    }

    currentQuestion = quiz.nextQuestion;  // queue up the next question

    setState(() {
      visibleOverlay = false; // remove the overlay after user answer
      questionNumber = quiz.currentQuestionNumber;
      questionText = currentQuestion.question;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(  // to stack the overlay on top of the column of widgets
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true, () => handleAnswer(true)),
            QuestionText(questionNumber: questionNumber, questionText: questionText),
            AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        visibleOverlay == true ? CorrectWrongOverlay(this.isCorrect, onOverlayPress) : Container(),
      ],
      fit: StackFit.expand,
    );
  }
}