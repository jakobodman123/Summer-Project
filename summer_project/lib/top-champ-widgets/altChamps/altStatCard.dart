import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/util/matchHistoryTotals.dart';

class AltStatCard extends StatelessWidget {
  final MatchHistoryTotals? matchHistoryTotals;
  final int? games;

  const AltStatCard({Key? key, this.matchHistoryTotals, this.games})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.black,
        elevation: 20,
        color: colorGrey,
        child: SizedBox(
          height: 100 * 0.7,
          width: 230 * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Gold: ',
                        style: TextStyle(
                            fontSize: 16 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        (matchHistoryTotals!.goldEarnedTotal! / games!)
                                .toStringAsFixed(0) +
                            "G",
                        style: const TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                            fontSize: 16 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'CS: ',
                        style: TextStyle(
                            fontSize: 16 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        (matchHistoryTotals!.csTotals! / games!)
                                .toStringAsFixed(0) +
                            "G",
                        style: const TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                            fontSize: 16 * 0.7,
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
                      const Text(
                        'Dmg: ',
                        style: TextStyle(
                            fontSize: 16 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        (matchHistoryTotals!.damageTotal! / games!)
                            .toStringAsFixed(0),
                        style: const TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                            fontSize: 16 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Total Kills: ',
                        style: TextStyle(
                            fontSize: 16 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        (matchHistoryTotals!.killsTotal!).toStringAsFixed(0),
                        style: const TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                            fontSize: 16 * 0.7,
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
