import 'package:flutter/material.dart';
import 'package:summer_project/accolades.dart';

import 'package:summer_project/accoladesItem.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/matchHistoryTotals.dart';

class AccoladesPage extends StatelessWidget {
  List<AccoladesItem> accoladeList = [];

  final MatchHistoryTotals? matchHistoryTotals;
  final int? games;

  AccoladesPage({Key? key, this.matchHistoryTotals, this.games})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Accolades accolades = Accolades();
    if ((matchHistoryTotals!.killsTotal! / games!) >= 10) {
      accoladeList.add(
          accolades.bloodThirsty(matchHistoryTotals!.killsTotal! / games!));
    }
    if ((matchHistoryTotals!.pinkWardsTotal! / games!) >= 2) {
      accoladeList.add(
          accolades.pinkWards(matchHistoryTotals!.pinkWardsTotal! / games!));
    }

    if ((matchHistoryTotals!.killingSpreeTotal! / games!) >= 2) {
      accoladeList.add(accolades
          .killingSpree(matchHistoryTotals!.killingSpreeTotal! / games!));
    }
    if ((matchHistoryTotals!.pentaKillsTotal! / games!) >= 0.06) {
      accoladeList.add(
          accolades.godGamer(matchHistoryTotals!.pentaKillsTotal! / games!));
    }

    if ((matchHistoryTotals!.deathsTotal! / games!) >= 9) {
      accoladeList
          .add(accolades.diesAlot(matchHistoryTotals!.deathsTotal! / games!));
    }

    if ((matchHistoryTotals!.baronKillsTotal! / games!) >= 0.5) {
      accoladeList.add(
          accolades.baronRaider(matchHistoryTotals!.baronKillsTotal! / games!));
    }

    if ((matchHistoryTotals!.endGameLevelTotal! / games!) >= 15) {
      accoladeList.add(accolades
          .lateGameLover(matchHistoryTotals!.endGameLevelTotal! / games!));
    }

    if ((matchHistoryTotals!.visionScoreTotal! / games!) >= 35) {
      accoladeList.add(accolades
          .visionLegend(matchHistoryTotals!.visionScoreTotal! / games!));
    }

    if ((matchHistoryTotals!.visionScoreTotal! / games!) <= 15) {
      accoladeList.add(
          accolades.badVision(matchHistoryTotals!.visionScoreTotal! / games!));
    }
    if ((matchHistoryTotals!.damageTotal! / games!) >= 25000) {
      accoladeList
          .add(accolades.highDamage(matchHistoryTotals!.damageTotal! / games!));
    }

    accoladeList.add(accolades
        .demolisher(matchHistoryTotals!.dmgToStructuresTotal! / games!));

    accoladeList.add(
        accolades.dragonTamer(matchHistoryTotals!.dragonKillsTotal! / games!));
    accoladeList.add(accolades
        .firstBloodExpert(matchHistoryTotals!.firstBloodTotal! / games!));

    accoladeList.add(accolades
        .epicStealer(matchHistoryTotals!.objectiveStealTotal! / games!));

    accoladeList
        .add(accolades.tank(matchHistoryTotals!.damageTakenTotal! / games!));
    accoladeList.add(
        accolades.turretKiller(matchHistoryTotals!.turretKillsTotal! / games!));

    matchHistoryTotals!.acesBefore15MinutesTotal;

    matchHistoryTotals!.alliedJungleMonsterKillsTotal;
    matchHistoryTotals!.buffStolenTotal;
    matchHistoryTotals!.damagePerMinuteTotal;
    matchHistoryTotals!.damageSelfMitigatedTotal;
    matchHistoryTotals!.damageTakenOnTeamPercentageTotal;
    matchHistoryTotals!.damageTakenTotal;
    matchHistoryTotals!.dodgeSkillShotsSmallWindowTotal;
    matchHistoryTotals!.doubleKillsTotal;
    matchHistoryTotals!.dragonKillsTotal;
    //error
    matchHistoryTotals!.earlyLaningPhaseGoldExpAdvantageTotal;
    //error
    matchHistoryTotals!.enemyJungleMonsterKillsTotal;
    matchHistoryTotals!.gameEndedInSurrenderTotal;
    matchHistoryTotals!.gameLengthTotal;
    matchHistoryTotals!.goldEarnedTotal;
    matchHistoryTotals!.goldPerMinuteTotal;
    matchHistoryTotals!.hadOpenNexusWinsTotal;
    matchHistoryTotals!.immobilizeAndKillWithAllyTotal;
    matchHistoryTotals!.jungleCsBefore10MinutesTotal;
    matchHistoryTotals!.killAfterHiddenWithAllyTotal;
    matchHistoryTotals!.killParticipationTotal;
    matchHistoryTotals!.killsUnderOwnTurretTotal;
    matchHistoryTotals!.landSkillShotsEarlyGameTotal;
    matchHistoryTotals!.laneMinionsFirst10MinutesTotal;
    matchHistoryTotals!.legendaryCountTotal;
    matchHistoryTotals!.lostAnInhibitorWinsTotal;
    matchHistoryTotals!.maxCsAdvantageOnLaneOpponentTotal;
    matchHistoryTotals!.multiTurretRiftHeraldCountTotal;
    matchHistoryTotals!.multikillsAfterAggressiveFlashTotal;
    matchHistoryTotals!.multikillsTotal;
    matchHistoryTotals!.outnumberedKillsTotal;
    matchHistoryTotals!.perfectGameTotal;
    matchHistoryTotals!.perfectDragonSoulsTakenTotal;
    matchHistoryTotals!.quadraKillsTotal;
    matchHistoryTotals!.quickCleanseTotal;
    matchHistoryTotals!.quickSoloKillsTotal;
    matchHistoryTotals!.saveAllyFromDeathTotal;
    matchHistoryTotals!.scuttleCrabKillsTotal;
    matchHistoryTotals!.soloBaronKillsTotal;
    matchHistoryTotals!.soloKillsTotal;
    matchHistoryTotals!.turretKillsTotal;
    matchHistoryTotals!.turretPlatesTakenTotal;

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
