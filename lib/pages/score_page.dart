import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Your score: ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40, fontStyle: FontStyle.italic)),
          Text("$score / $totalQuestions",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40, fontStyle: FontStyle.italic)),
          WillPopScope(  // to prevent the android back button from allowing user to go back to last question
            onWillPop: () async => false,
            child: IconButton(
              icon: Icon(Icons.arrow_right),
              iconSize: 80,
              color: Colors.amber,
              tooltip: 'Restart the app',
              onPressed: () => Navigator.of(context).pushNamed('landing_page'),
            ),
          ),
          RaisedButton(
            child: Text('Close the app', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, fontStyle: FontStyle.italic)),
            color: Colors.amber,
            onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            autofocus: true,
          )
        ],
      )
    );
  }

}