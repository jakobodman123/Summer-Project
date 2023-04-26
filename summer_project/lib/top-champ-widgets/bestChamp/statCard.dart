import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'package:summer_project/main.dart';
import 'package:summer_project/util/matchHistoryTotals.dart';

class StatCard extends StatelessWidget {
  final MatchHistoryTotals? matchHistoryTotals;
  final int? games;

  const StatCard({Key? key, this.matchHistoryTotals, this.games})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.black,
        elevation: 10,
        color: colorGrey,
        child: SizedBox(
          height: 150 * 0.7,
          width: 460 * 0.7,
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
                        'GPM: ',
                        style: TextStyle(
                            fontSize: 16 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        (matchHistoryTotals!.goldPerMinuteTotal! / games!)
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
                        'Double Kills: ',
                        style: TextStyle(
                            fontSize: 16 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        (matchHistoryTotals!.doubleKillsTotal!)
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
                        'Tripple Kills: ',
                        style: TextStyle(
                            fontSize: 16 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        (matchHistoryTotals!.tripleKillsTotal!)
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
                        'Quadra Kills: ',
                        style: TextStyle(
                            fontSize: 16 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        (matchHistoryTotals!.quadraKillsTotal!)
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Dmg Dealt: ',
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
                        'Dmg Taken: ',
                        style: TextStyle(
                            fontSize: 16 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        (matchHistoryTotals!.damageTakenTotal! / games!)
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
