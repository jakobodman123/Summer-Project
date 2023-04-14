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
        shadowColor: Colors.blue,
        elevation: 20,
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
                      GlowText(
                        (matchHistoryTotals!.goldEarnedTotal! / games!)
                                .toStringAsFixed(0) +
                            "G",
                        glowColor: Colors.blue,
                        style: const TextStyle(
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
                      GlowText(
                        (matchHistoryTotals!.goldPerMinuteTotal! / games!)
                                .toStringAsFixed(0) +
                            "G",
                        glowColor: Colors.blue,
                        style: const TextStyle(
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
                      GlowText(
                        (matchHistoryTotals!.csTotals! / games!)
                                .toStringAsFixed(0) +
                            "G",
                        glowColor: Colors.blue,
                        style: const TextStyle(
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
                      GlowText(
                        (matchHistoryTotals!.doubleKillsTotal!)
                            .toStringAsFixed(0),
                        glowColor: Colors.blue,
                        style: const TextStyle(
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
                      GlowText(
                        (matchHistoryTotals!.tripleKillsTotal!)
                            .toStringAsFixed(0),
                        glowColor: Colors.blue,
                        style: const TextStyle(
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
                      GlowText(
                        (matchHistoryTotals!.quadraKillsTotal!)
                            .toStringAsFixed(0),
                        glowColor: Colors.blue,
                        style: const TextStyle(
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
                      GlowText(
                        (matchHistoryTotals!.damageTotal! / games!)
                            .toStringAsFixed(0),
                        glowColor: Colors.blue,
                        style: const TextStyle(
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
                      GlowText(
                        (matchHistoryTotals!.damageTakenTotal! / games!)
                            .toStringAsFixed(0),
                        glowColor: Colors.blue,
                        style: const TextStyle(
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
                      GlowText(
                        (matchHistoryTotals!.killsTotal!).toStringAsFixed(0),
                        glowColor: Colors.blue,
                        style: const TextStyle(
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
