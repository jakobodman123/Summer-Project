import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/champMasterIcon.dart';
import 'package:summer_project/main.dart';

class ChampMasteryCard extends StatelessWidget {
  final List<ChampionMastery>? championMasteryList;
  const ChampMasteryCard({Key? key, this.championMasteryList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorGrey,
      shadowColor: Colors.blue,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChampMasteryIcon(
            champName: championMasteryList?[0].championName,
            champMastery: championMasteryList?[0].championPoints,
          ),
          ChampMasteryIcon(
            champName: championMasteryList?[1].championName,
            champMastery: championMasteryList?[1].championPoints,
          ),
          ChampMasteryIcon(
            champName: championMasteryList?[2].championName,
            champMastery: championMasteryList?[2].championPoints,
          ),
          ChampMasteryIcon(
            champName: championMasteryList?[3].championName,
            champMastery: championMasteryList?[3].championPoints,
          ),
        ],
      ),
    );
  }
}
