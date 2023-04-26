import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:summer_project/util/kdaWidget.dart';
import 'package:summer_project/main.dart';

class KdWinrateWidget extends StatelessWidget {
  final int? kills;
  final int? deaths;
  final int? assists;

  final int? gamesPlayed;
  final int? wins;
  final int? losses;

  const KdWinrateWidget(this.gamesPlayed, this.kills, this.deaths, this.assists,
      this.wins, this.losses);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: MediaQuery.of(context).size.width,
      child: Card(
        color: colorGrey,
        shadowColor: Colors.black,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            KdaWidget(
              kills: kills,
              deaths: deaths,
              assists: assists,
              gamesPlayed: gamesPlayed,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5 * 0.7,
              ),
              child: Column(
                children: [
                  CircularPercentIndicator(
                    radius: 40.0 * 0.7,
                    lineWidth: 5.0 * 0.7,
                    percent: wins! / gamesPlayed!,
                    center: Text(
                      ((wins! / gamesPlayed!) * 100).toStringAsFixed(1),
                      style: TextStyle(
                          shadows: const [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.black,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                          fontSize: 28 * 0.7,
                          fontWeight: FontWeight.bold,
                          color: (wins! / gamesPlayed! * 100) >= 50.0
                              ? Colors.green
                              : Colors.red),
                    ),
                    progressColor: (wins! / gamesPlayed! * 100) >= 50.0
                        ? Colors.green
                        : Colors.red,
                  ),
                  const Text(
                    "Winrate",
                    style: TextStyle(
                      fontSize: 17 * 0.7,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 5 * 0.7,
                top: 5 * 0.7,
              ),
              child: Column(
                children: [
                  CircularPercentIndicator(
                    radius: 40.0 * 0.7,
                    lineWidth: 5.0 * 0.7,
                    percent: 1,
                    center: Text(
                      gamesPlayed.toString(),
                      style: const TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                        fontSize: 28 * 0.7,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    progressColor: Colors.blue,
                  ),
                  const Text(
                    "Games",
                    style: TextStyle(
                      fontSize: 17 * 0.7,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
