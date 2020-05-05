import 'package:flutter/material.dart';
import 'package:quiz/landing_page.dart';
import './pages/quiz_page.dart';   // for routing with onGenerateRoute
import './pages/score_page.dart';  // for routing with onGenerateRoute

void main() {
  runApp(Root());
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case 'landing_page': { // to go back from score page at the end of the quiz to the landing page
            return MaterialPageRoute(
              builder: (context) {
                return LandingPage();
              }
            );
          }
          case 'quiz_page': {  // to go from landing page to quiz page
            return MaterialPageRoute(
              builder: (context) {
                return QuizPage();
              });
          }
          case 'score_page': {  // to go to score page from the correctWrongOverlay page
            final ScorePage arguments = settings.arguments;
            return MaterialPageRoute(
              builder: (context) {
                return ScorePage(arguments.score, arguments.totalQuestions);
              }
            );
          }
          default:
            return null;
        }
      },
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(brightness: MediaQuery.platformBrightnessOf(context)), 
    );
  }
}