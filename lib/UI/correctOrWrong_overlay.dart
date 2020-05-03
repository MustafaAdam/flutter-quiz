import 'package:flutter/material.dart';
import 'dart:math' as math; // for PI value used for the icon rotation animation

class CorrectWrongOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._onTap);

  @override
  _CorrectWrongOverlayState createState() => _CorrectWrongOverlayState();
}

class _CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin{
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _iconAnimation = CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimationController.addListener(() => this.setState(() { }));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54, // transparent black
      child: InkWell(
        onTap: () => widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: widget._isCorrect == true ? Colors.cyan : Colors.red,
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                angle: _iconAnimation.value * 2 * math.pi,
                child: Icon(widget._isCorrect == true ? Icons.done : Icons.clear, 
                            size: _iconAnimation.value * 80),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(widget._isCorrect == true ? "Correct!" : "Wrong!",
                          style: TextStyle(color: widget._isCorrect == true ? Colors.cyan : Colors.red, fontSize: 30)
                         ),
            )
          ],
        )
      )
    );
  }
}