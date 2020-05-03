import 'package:quiz/utils/question.dart';

class Quiz {
  // The series of questions [class Question] the user will be asked.
  // Arguments:
  //    1. List<Question> _questions
  // Getters:
  //    1. questions -> List of questions [type List<Question>].
  //    2. length -> How many questions are there.
  //    3. currentQuestionNumber --> The number of current question.
  //    4. score -> Current score of the user.


  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  // getters for the Quiz class variables
  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get currentQuestionNumber => _currentQuestionIndex + 1;
  int get score => _score;

  Question get nextQuestion {
    try {
      _currentQuestionIndex++;
      return _questions[_currentQuestionIndex];
    }
    catch(RangeError) {
      return null;
    }
  }

  // If the answer is correct, increase the score by one
  void answer(bool isCorrect) {
    if(isCorrect) _score++;
  }
}