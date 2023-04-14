import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:summer_project/accolades/accoladesPage.dart';
import 'package:summer_project/bestChampionWidget.dart';
import 'package:summer_project/kdWinrateWidget.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/masteryCard.dart';
import 'package:summer_project/matchHistoryTotals.dart';
import 'package:summer_project/statCard.dart';

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
    // TODO: implement build
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: colorLightGrey,
          elevation: 10,
          child: SizedBox(
            width: 500 * 0.7,
            height: 1150 * 0.7,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    summonerName! + "'s most played is " + champName!,
                    style: const TextStyle(
                      fontSize: 24 * 0.7,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    now,
                    style:
                        const TextStyle(fontSize: 20 * 0.7, color: Colors.grey),
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
        ));
  }
}
