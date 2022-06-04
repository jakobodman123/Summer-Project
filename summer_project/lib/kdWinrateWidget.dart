import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:summer_project/kdaWidget.dart';
import 'package:summer_project/main.dart';

class KdWinrateWidget extends StatelessWidget {
  final String kda;
  final int winrate;
  final int gamesPlayed;

  KdWinrateWidget(this.kda, this.winrate, this.gamesPlayed);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Card(
        color: colorGrey,
        shadowColor: Colors.blue,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
              ),
              child: KdaWidget(
                  kills: 17000,
                  deaths: 5043,
                  assists: 12582,
                  gamesPlayed: 1107),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
              ),
              child: Column(
                children: [
                  CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 5.0,
                    percent: winrate.toDouble() / 100,
                    center: GlowText(
                      winrate.toString(),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    progressColor: Colors.green,
                  ),
                  const Text(
                    "Winrate",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 40,
                top: 5,
              ),
              child: Column(
                children: [
                  CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 5.0,
                    percent: 1,
                    center: GlowText(
                      gamesPlayed.toString(),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    progressColor: Colors.blue,
                  ),
                  const Text(
                    "Games",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
