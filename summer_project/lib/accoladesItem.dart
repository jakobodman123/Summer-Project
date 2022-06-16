import 'package:flutter/material.dart';

class AccoladesItem extends StatelessWidget {
  final int value;
  final String title;
  final String description;
  final double score;
  final bool positive;

  AccoladesItem({
    Key? key,
    required this.value,
    required this.title,
    required this.description,
    required this.score,
    required this.positive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      richMessage: TextSpan(
        text: description + score.toStringAsFixed(1) + "/g",
        style: TextStyle(color: Colors.white),
      ),
      child: Card(
        shadowColor: Colors.blue,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: positive
            ? Color(0xFF6082B6).withOpacity(0.3)
            : Color.fromRGBO(255, 82, 82, 1).withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
