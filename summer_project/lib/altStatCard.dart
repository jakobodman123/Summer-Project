import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:summer_project/accoladesItem.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/matchHistoryTotals.dart';

class AltStatCard extends StatelessWidget {
  final MatchHistoryTotals? matchHistoryTotals;
  final int? games;

  AltStatCard({Key? key, this.matchHistoryTotals, this.games})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.blue,
        elevation: 20,
        color: colorGrey,
        child: Container(
          height: 100,
          width: 280,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        'Gold: ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      GlowText(
                        (matchHistoryTotals!.goldEarnedTotal! / games!)
                                .toStringAsFixed(1) +
                            "G",
                        glowColor: Colors.blue,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'CS: ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      GlowText(
                        (matchHistoryTotals!.csTotals! / games!)
                                .toStringAsFixed(1) +
                            "G",
                        glowColor: Colors.blue,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        'Dmg Dealt: ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      GlowText(
                        (matchHistoryTotals!.damageTotal! / games!)
                            .toStringAsFixed(1),
                        glowColor: Colors.blue,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Total Kills: ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      GlowText(
                        (matchHistoryTotals!.killsTotal!).toString(),
                        glowColor: Colors.blue,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
