//https://flutter.dev/docs/development/ui/animations/tutorial

import 'package:flutter/material.dart';


class QuestionText extends StatefulWidget {
  final int questionNumber;
  final String questionText;

  QuestionText({this.questionNumber, this.questionText});

  @override
  _QuestionTextState createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin{
  /*
    The question text will have an animation.
   The SingleTicketProvideStateMixin is for that
  */
  Animation<double> _fontSizeAnimation;  // [0, 0.1, 0.2, .... , 1]
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    // vsync handles animations that go outside the screen
    _fontSizeAnimationController = AnimationController(duration: Duration(seconds: 1), vsync: this); 
    _fontSizeAnimation = CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.elasticOut);
    _fontSizeAnimation.addListener(() => this.setState( () {} ));
    _fontSizeAnimationController.forward();
  }

  // didUpdateWidget is overriden because the QuestionText animation was appearing on the first question only
  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if the old widget's questionText is different from the new widget's questionText(meaning a new question)
    if(oldWidget.questionText != widget.questionText) { 
      // restart the widget animation
      _fontSizeAnimationController.reset(); // reset the animation
      _fontSizeAnimationController.forward();  // restart the animation
    }
  }

  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Material(
          color: Colors.yellowAccent,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text('Question ' + widget.questionNumber.toString() + ': ' + widget.questionText,
                style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: _fontSizeAnimation.value * 15 // (* 15) so that the text is not too small
                       )
                  )
            )
          ),

        );
  }
}