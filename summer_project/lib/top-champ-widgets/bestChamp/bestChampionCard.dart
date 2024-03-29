import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:summer_project/accolades/accoladesPage.dart';
import 'package:summer_project/top-champ-widgets/bestChamp/bestChampionWidget.dart';
import 'package:summer_project/summoner-widgets/kdWinrateWidget.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/summoner-widgets/masteryCard.dart';
import 'package:summer_project/util/matchHistoryTotals.dart';
import 'package:summer_project/top-champ-widgets/bestChamp/statCard.dart';

class BestChampionCard extends StatelessWidget {
  final String? champName;
  final String? summonerName;
  final MatchHistoryTotals? matchHistoryTotals;
  final int? gamesPlayed;

  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());

  BestChampionCard(
      {Key? key,
      required this.champName,
      this.summonerName,
      this.matchHistoryTotals,
      this.gamesPlayed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: colorLightGrey,
      elevation: 10,
      child: SizedBox(
        width: 450 * 0.7,
        height: 1150 * 0.7,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            now,
            style: const TextStyle(fontSize: 20 * 0.7, color: Colors.grey),
          ),
          BestChampionPicture(champName!),
          KdWinrateWidget(
            matchHistoryTotals!.gamesPlayed,
            matchHistoryTotals!.killsTotal,
            matchHistoryTotals!.deathsTotal,
            matchHistoryTotals!.assistsTotal,
            matchHistoryTotals!.winsTotal,
            matchHistoryTotals!.lossesTotal,
          ),
          const Text(
            'Champion Accolades',
            style: TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
                fontSize: 20 * 0.7,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          AccoladesPage(
              matchHistoryTotals: matchHistoryTotals,
              games: gamesPlayed,
              champName: champName),
          const Text(
            'Champion Stats',
            style: TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
                fontSize: 20 * 0.7,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          StatCard(
            matchHistoryTotals: matchHistoryTotals,
            games: gamesPlayed,
          ),
        ]),
      ),
    );
  }
}
