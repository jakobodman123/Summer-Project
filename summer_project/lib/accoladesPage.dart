import 'package:flutter/material.dart';

import 'package:summer_project/accoladesItem.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/matchHistoryTotals.dart';

class AccoladesPage extends StatelessWidget {
  List<AccoladesItem> accoladeList = [];

  final MatchHistoryTotals? matchHistoryTotals;

  AccoladesPage({Key? key, this.matchHistoryTotals}) : super(key: key);

  AccoladesItem bloodThirsty(double score) {
    return AccoladesItem(
        value: 1,
        title: "Bloodthirsty",
        description:
            "This player is hunting for blood every game! Average kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem pinkWards(double score) {
    return AccoladesItem(
        value: 2,
        title: "ControllWards<3",
        description:
            "This player is making sure his teams bushes are safe! Average amount of Pink wards bought last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem baronRaider(double score) {
    return AccoladesItem(
        value: 1,
        title: "Mythic Raider",
        description:
            "This player is an Echo level raider at taking barons! Average baron kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem lateGameLover(double score) {
    return AccoladesItem(
        value: 1,
        title: "Late Game Lover",
        description:
            "This player usually stalls out games! Average end game level last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem demolisher(double score) {
    return AccoladesItem(
        value: 1,
        title: "Demolisher",
        description:
            "This player loves to siege structures! Average damage to structures last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem diesAlot(double score) {
    return AccoladesItem(
        value: 1,
        title: "Dies a lot",
        description:
            "This player might love the color grey a bit to much! Average deaths last 30 games is ",
        score: score,
        positive: false);
  }

  AccoladesItem dragonTamer(double score) {
    return AccoladesItem(
        value: 1,
        title: "Dragon Tamer",
        description:
            "This player know how to tame(kill) the dragons of summoners rift! Average dragon kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem firstBloodExpert(double score) {
    return AccoladesItem(
        value: 1,
        title: "First Blood Expert",
        description:
            "This player does not hestitate to start the action early! Average first bloods last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem killingSpree(double score) {
    return AccoladesItem(
        value: 1,
        title: "Killing Spree!",
        description:
            "Killing spree might be blasting your headphones often with this player! Average killing sprees last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem epicStealer(double score) {
    return AccoladesItem(
        value: 1,
        title: "Epic Stealer",
        description:
            "Make sure you ready your smite and train your reflexs against this player! Average objectives stolen last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem godGamer(double score) {
    return AccoladesItem(
        value: 1,
        title: "God Gamer",
        description:
            "How does he even get this good at killing champions?! Average Penta Kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem highDamage(double score) {
    return AccoladesItem(
        value: 1,
        title: "High Damage!",
        description:
            "This player is looking real good on the damage meters! Average Damage Dealt to Champions last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem tank(double score) {
    return AccoladesItem(
        value: 1,
        title: "Tank",
        description:
            "This player likes to soak damage for his team! For good or for bad =D Average Damage Dealt to Champions last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem turretKiller(double score) {
    return AccoladesItem(
        value: 1,
        title: "Turret Killer",
        description:
            "Might want to rethink roaming against this player! Average Turret Kills last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem visionLegend(double score) {
    return AccoladesItem(
        value: 1,
        title: "Vision Legend",
        description:
            "Your wards have nightmares about this player! Average Vision Score last 30 games is ",
        score: score,
        positive: true);
  }

  AccoladesItem badVision(double score) {
    return AccoladesItem(
        value: 1,
        title: "Bad Vision",
        description:
            "Trinkets are free! Drop some wards my man! Average Vision Score last 30 games is ",
        score: score,
        positive: false);
  }

  @override
  Widget build(BuildContext context) {
    if ((matchHistoryTotals!.killsTotal! / 30) >= 10) {
      accoladeList.add(bloodThirsty(matchHistoryTotals!.killsTotal! / 30));
    }
    if ((matchHistoryTotals!.pinkWardsTotal! / 30) >= 2) {
      accoladeList.add(pinkWards(matchHistoryTotals!.pinkWardsTotal! / 30));
    }

    if ((matchHistoryTotals!.killingSpreeTotal! / 30) >= 2) {
      accoladeList
          .add(killingSpree(matchHistoryTotals!.killingSpreeTotal! / 30));
    }
    if ((matchHistoryTotals!.pentaKillsTotal! / 30) >= 0.06) {
      accoladeList.add(godGamer(matchHistoryTotals!.pentaKillsTotal! / 30));
    }

    if ((matchHistoryTotals!.deathsTotal! / 30) >= 9) {
      accoladeList.add(diesAlot(matchHistoryTotals!.deathsTotal! / 30));
    }

    if ((matchHistoryTotals!.baronKillsTotal! / 30) >= 0.5) {
      accoladeList.add(baronRaider(matchHistoryTotals!.baronKillsTotal! / 30));
    }

    if ((matchHistoryTotals!.endGameLevelTotal! / 30) >= 15) {
      accoladeList
          .add(lateGameLover(matchHistoryTotals!.endGameLevelTotal! / 30));
    }

    if ((matchHistoryTotals!.visionScoreTotal! / 30) >= 35) {
      accoladeList
          .add(visionLegend(matchHistoryTotals!.visionScoreTotal! / 30));
    }

    if ((matchHistoryTotals!.visionScoreTotal! / 30) <= 15) {
      accoladeList.add(badVision(matchHistoryTotals!.visionScoreTotal! / 30));
    }
    if ((matchHistoryTotals!.damageTotal! / 30) >= 25000) {
      accoladeList.add(highDamage(matchHistoryTotals!.damageTotal! / 30));
    }

    accoladeList
        .add(demolisher(matchHistoryTotals!.dmgToStructuresTotal! / 30));

    accoladeList.add(dragonTamer(matchHistoryTotals!.dragonKillsTotal! / 30));
    accoladeList
        .add(firstBloodExpert(matchHistoryTotals!.firstBloodTotal! / 30));

    accoladeList
        .add(epicStealer(matchHistoryTotals!.objectiveStealTotal! / 30));

    accoladeList.add(tank(matchHistoryTotals!.damageTakenTotal! / 30));
    accoladeList.add(turretKiller(matchHistoryTotals!.turretKillsTotal! / 30));

    return Card(
        shadowColor: Colors.blue,
        elevation: 20,
        color: colorGrey,
        child: Container(
          height: 300,
          width: 460,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: (accoladeList.length < 1)
                          ? SizedBox()
                          : accoladeList[0],
                    ),
                    (accoladeList.length < 2) ? SizedBox() : accoladeList[1],
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: (accoladeList.length < 3)
                          ? SizedBox()
                          : accoladeList[2],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: (accoladeList.length < 4)
                        ? SizedBox()
                        : accoladeList[3],
                  ),
                  (accoladeList.length < 5) ? SizedBox() : accoladeList[4],
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: (accoladeList.length < 6)
                        ? SizedBox()
                        : accoladeList[5],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: (accoladeList.length < 7)
                        ? SizedBox()
                        : accoladeList[6],
                  ),
                  (accoladeList.length < 8) ? SizedBox() : accoladeList[7],
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: (accoladeList.length < 9)
                        ? SizedBox()
                        : accoladeList[8],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: (accoladeList.length < 10)
                          ? SizedBox()
                          : accoladeList[9],
                    ),
                    (accoladeList.length < 11) ? SizedBox() : accoladeList[10],
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: (accoladeList.length < 12)
                          ? SizedBox()
                          : accoladeList[11],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
