import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:summer_project/altAccoladesItem.dart';
import 'package:summer_project/altStatCard.dart';
import 'package:summer_project/kdaWidget.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/matchHistoryTotals.dart';

class AltChampsWidget extends StatelessWidget {
  final String? champName;
  final int? gamesPlayed;
  final int? wins;
  final MatchHistoryTotals? matchHistoryTotals;

  const AltChampsWidget(
    this.champName,
    this.gamesPlayed,
    this.wins,
    this.matchHistoryTotals,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 650,
      child: Card(
        elevation: 10,
        color: colorLightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 180.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          //alignment: FractionalOffset.topCenter,
                          image: AssetImage(
                              "assets/img/splash/${champName}_0.jpg"))),
                ),
                InkWell(
                    onTap: () {},
                    child: AltAccoladesItem(
                        matchHistoryTotals: matchHistoryTotals,
                        games: gamesPlayed,
                        champName: champName))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KdaWidget(
                  kills: matchHistoryTotals!.killsTotal,
                  deaths: matchHistoryTotals!.deathsTotal,
                  assists: matchHistoryTotals!.assistsTotal,
                  gamesPlayed: gamesPlayed,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 5.0,
                          percent: wins! / gamesPlayed!,
                          center: GlowText(
                            ((wins! / gamesPlayed!) * 100).toStringAsFixed(1),
                            style: const TextStyle(
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
                    Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 5.0,
                          percent: 1,
                          center: GlowText(
                            gamesPlayed.toString(),
                            style: const TextStyle(
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
                  ],
                ),
                AltStatCard(
                  matchHistoryTotals: matchHistoryTotals,
                  games: gamesPlayed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
