import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:summer_project/accoladesPage.dart';
import 'package:summer_project/bestChampionWidget.dart';
import 'package:summer_project/kdWinrateWidget.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/masteryCard.dart';

class BestChampionCard extends StatelessWidget {
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
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
        const Padding(
          padding: EdgeInsets.only(
            top: 40,
          ),
          child: Text(
            'Play Easy Champs' + " should play " + "Fizz",
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
          ),
          child: BestChampionPicture("Fizz"),
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
            child: MasteryCard(574176)),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
          ),
          child: AccoladesPage(),
        ),
      ]),
    );
  }
}
