import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:summer_project/accolades/altAccoladesItem.dart';
import 'package:summer_project/top-champ-widgets/altChamps/altStatCard.dart';
import 'package:summer_project/util/kdaWidget.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/util/matchHistoryTotals.dart';

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
    return SizedBox(
      //width: 535 * 0.7,
      child: Card(
        elevation: 10,
        color: colorLightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 150.0 * 0.7,
                  width: 250.0 * 0.7,
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
                          radius: 40.0 * 0.7,
                          lineWidth: 5.0 * 0.7,
                          percent: wins! / gamesPlayed!,
                          center: GlowText(
                            ((wins! / gamesPlayed!) * 100).toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 28 * 0.7,
                              fontWeight: FontWeight.bold,
                              color: (wins! / gamesPlayed! * 100) >= 50.0
                                  ? Colors.green
                                  : Colors.red,
                            ),
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
                    Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 40.0 * 0.7,
                          lineWidth: 5.0 * 0.7,
                          percent: 1,
                          center: GlowText(
                            gamesPlayed.toString(),
                            style: const TextStyle(
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
