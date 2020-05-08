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
    Question(question: "Adel is a gangsta", answer: true),
    Question(question: "ADNOC is a good company", answer: false),
    Question(question: "Real men drive a corolla", answer: true),
    Question(question: "Barcelona is better than Real Madrid", answer: true),
    Question(question: "Christiano Ronaldo is overrated", answer: true),
    Question(question: "Diyar call center agent have good salaries", answer: false),
    Question(question: "ADNOC call center agents deserve an ass whipping", answer: true),
    Question(question: "The Expanse is one of the best TV series of all time", answer: true),
    Question(question: "Metal Gear is the best video game", answer: true),
    Question(question: "Ahmed has huge biceps", answer: true),
    Question(question: "Mahmood needs to lose weight", answer: false),
    Question(question: "Mustafa is fat", answer: true),
    Question(question: "Adel can do one-arm pull ups", answer: true),
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