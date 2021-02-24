import 'package:flutter/material.dart';

class BounceBut extends StatefulWidget {
  @override
  _BounceButState createState() => _BounceButState();
}

class _BounceButState extends State<BounceBut> {
  double pressedWidth = 240;
  double pressedHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTapDown: (details) {
                print("longpressstart");
                setState(() {
                  pressedWidth = 230;
                  pressedHeight = 50;
                });
              },
              onTapUp: (details) {
                print("longpressend");
                setState(() {
                  pressedWidth = 240;
                  pressedHeight = 60;
                });
              },
              child: AnimatedContainer(
                curve: Curves.bounceOut,
                duration: Duration(milliseconds: 100),
                width: pressedWidth,
                height: pressedHeight,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
