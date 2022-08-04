import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  final size;
  MyBarrier({
    this.size
});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green
      ),
    );
  }
}

// git remote add origin https://github.com/Iqrarijaz/Flappy-Bird-Game-Using-Flutter.git
// git branch -M main
// git push -u origin main