import 'package:flutter/material.dart';
import './pages/quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            // context,
            MaterialPageRoute(builder: (context) => QuizPage())
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Let's Quizzz", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
            Text("Tap to start!", style: TextStyle(color: Colors.white, fontSize: 20)),
          ]
        ),
      ),
    );
  }
}