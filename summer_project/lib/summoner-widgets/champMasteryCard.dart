import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/summoner-widgets/champMasterIcon.dart';
import 'package:summer_project/main.dart';

class ChampMasteryCard extends StatelessWidget {
  final List<ChampionMastery>? championMasteryList;
  const ChampMasteryCard({Key? key, this.championMasteryList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorGrey,
      shadowColor: Colors.black,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChampMasteryIcon(
            champID: championMasteryList?[0].championID,
            champMastery: championMasteryList?[0].championPoints,
          ),
          ChampMasteryIcon(
            champID: championMasteryList?[1].championID,
            champMastery: championMasteryList?[1].championPoints,
          ),
          ChampMasteryIcon(
            champID: championMasteryList?[2].championID,
            champMastery: championMasteryList?[2].championPoints,
          ),
          ChampMasteryIcon(
            champID: championMasteryList?[3].championID,
            champMastery: championMasteryList?[3].championPoints,
          ),
        ],
      ),
    );
  }
}
