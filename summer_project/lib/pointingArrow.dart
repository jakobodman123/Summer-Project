import 'package:flutter/material.dart';
import 'dart:math';

class ArrowAnimation extends StatefulWidget {
  @override
  _ArrowAnimationState createState() => _ArrowAnimationState();
}

class _ArrowAnimationState extends State<ArrowAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward();
      },
      child: Container(
        width: 40,
        height: 40,
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value * 3.14159265359,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 30,
                ),
              );
            },
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
