import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:summer_project/main.dart';

class KdaWidget extends StatelessWidget {
  final int? kills;
  final int? deaths;
  final int? assists;
  final int? gamesPlayed;
  final double? size;

  const KdaWidget(
      {Key? key,
      required this.kills,
      required this.deaths,
      required this.assists,
      required this.gamesPlayed,
      this.size = 28})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        GlowText(
          (kills! / gamesPlayed!).toStringAsFixed(1),
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        GlowText(
          " / ",
          style: TextStyle(
            fontSize: size! * 0.71,
            color: Colors.black,
          ),
        ),
        GlowText(
          (deaths! / gamesPlayed!).toStringAsFixed(1),
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        GlowText(
          " / ",
          style: TextStyle(
            fontSize: size! * 0.71,
            color: Colors.black,
          ),
        ),
        GlowText(
          (assists! / gamesPlayed!).toStringAsFixed(1),
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
