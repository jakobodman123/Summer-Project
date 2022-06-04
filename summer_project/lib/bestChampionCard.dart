import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:summer_project/accoladesPage.dart';
import 'package:summer_project/bestChampionWidget.dart';
import 'package:summer_project/kdWinrateWidget.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/masteryCard.dart';
import 'package:summer_project/matchHistoryTotals.dart';

class BestChampionCard extends StatelessWidget {
  final String? champName;
  final int? champMastery;
  final String? summonerName;
  final MatchHistoryTotals? matchHistoryTotals;

  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());

  BestChampionCard(
      {Key? key,
      required this.champName,
      required this.champMastery,
      this.summonerName,
      this.matchHistoryTotals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: colorLightGrey,
      elevation: 10,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.only(
            top: 40,
          ),
          child: Text(
            summonerName! + " should play " + champName!,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
          ),
          child: Text(
            now,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            left: 10,
            right: 10,
          ),
          child: BestChampionPicture(champName!),
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: KdWinrateWidget("12.8/7.6/12.3", 59, 176)),
        Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: MasteryCard(champMastery!)),
        Padding(
          padding: EdgeInsets.only(
            top: 5,
          ),
          child: Text(
            'Champion Accolades',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
          ),
          child: AccoladesPage(matchHistoryTotals: matchHistoryTotals),
        ),
      ]),
    );
  }
}
