import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool _answer;
  final VoidCallback _onTap;

  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
          color: _answer == true ? Colors.greenAccent : Colors.redAccent,
          child: InkWell(
            onTap: _onTap,
            child: Center(
              child: Container(  // The reason for container widget is to add fancy borders around the 'True' or 'False' text
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                ),
                padding: EdgeInsets.all(20),
                child: Text(
                    _answer == true ? 'True' : 'False',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35.0, fontStyle: FontStyle.italic)
                  )
              )
            ),
            highlightColor: Colors.black38,
        ),
      ),
    );
  }
}