import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchDate extends StatelessWidget {
  final DateTime date;

  const MatchDate({Key? key, required this.date}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            text: date.hour < 10
                ? "0" + date.hour.toString() + ":"
                : date.hour.toString() + ":",
            style: TextStyle(
                fontSize: 16 * 0.7,
                fontWeight: FontWeight.bold,
                color: Colors.grey.withOpacity(0.8)),
            children: <TextSpan>[
              TextSpan(
                text: date.minute < 10
                    ? "0" + date.minute.toString() + " "
                    : date.minute.toString() + " ",
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: "",
            style: TextStyle(
                fontSize: 16 * 0.7,
                fontWeight: FontWeight.bold,
                color: Colors.grey.withOpacity(0.8)),
            children: <TextSpan>[
              TextSpan(
                text: date.month < 10
                    ? "0" + date.month.toString() + "-"
                    : date.month.toString() + "-",
              ),
              TextSpan(
                text: date.day < 10
                    ? "0" + date.day.toString()
                    : date.day.toString(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
