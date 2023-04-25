import 'package:flutter/material.dart';
import 'package:summer_project/util/matchHistoryTotals.dart';

import 'bestChampionCard.dart';

class BestChampSection extends StatelessWidget {
  final MatchHistoryTotals? mht1;
  final String? summonerName;
  final int? champID;

  const BestChampSection(
      {Key? key,
      required this.mht1,
      required this.summonerName,
      required this.champID})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        summonerName! + "'s most played",
        style: const TextStyle(
          fontSize: 28 * 0.7,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 2.0,
              color: Colors.blue,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
      ),
      BestChampionCard(
        summonerName: summonerName,
        //champName: widget.masteryList![0].championName?.replaceAll(RegExp(r"\s+\b|\b\s"), ""),
        champID: champID,
        matchHistoryTotals: mht1,
        gamesPlayed: mht1!.gamesPlayed,
      ),
    ]);
  }
}
