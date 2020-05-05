import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('quiz_page');
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