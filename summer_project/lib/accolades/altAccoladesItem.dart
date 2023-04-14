import 'package:flutter/material.dart';
import 'package:summer_project/accolades/accolades.dart';

import 'package:summer_project/accolades/accoladesItem.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/matchHistoryTotals.dart';

class AltAccoladesItem extends StatelessWidget {
  final List<AccoladesItem> accoladeList = [];

  final MatchHistoryTotals? matchHistoryTotals;
  final int? games;
  final String? champName;

  AltAccoladesItem(
      {Key? key, this.matchHistoryTotals, this.games, this.champName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Accolades accolades = Accolades(matchHistoryTotals, games);

    if (champName != null &&
        matchHistoryTotals!.winsTotal! / games! >= 0.60 &&
        games! >= 5) {
      accoladeList.add(accolades.greatWith(
          matchHistoryTotals!.winsTotal! / games!, champName));
    }

    if (champName != null &&
        matchHistoryTotals!.winsTotal! / games! <= 0.40 &&
        games! >= 6) {
      accoladeList.add(accolades.badWith(
          matchHistoryTotals!.winsTotal! / games!, champName));
    }

    if (champName != null && games! >= 10 && games! < 15) {
      accoladeList.add(accolades.champLover(games!.toDouble(), champName));
    }

    if (champName != null && games! >= 15) {
      accoladeList.add(accolades.champMain(games!.toDouble(), champName));
    }
    if ((matchHistoryTotals!.killsTotal! / games!) >= 10 && games! >= 3) {
      accoladeList.add(
          accolades.bloodThirsty(matchHistoryTotals!.killsTotal! / games!));
    }
    if ((matchHistoryTotals!.pinkWardsTotal! / games!) >= 2 && games! >= 3) {
      accoladeList.add(
          accolades.pinkWards(matchHistoryTotals!.pinkWardsTotal! / games!));
    }

    if ((matchHistoryTotals!.killingSpreeTotal! / games!) >= 2) {
      accoladeList.add(accolades
          .killingSpree(matchHistoryTotals!.killingSpreeTotal! / games!));
    }
    if ((matchHistoryTotals!.pentaKillsTotal! / games!) >= 0.06) {
      accoladeList.add(
          accolades.godGamer(matchHistoryTotals!.pentaKillsTotal!.toDouble()));
    }

    if ((matchHistoryTotals!.deathsTotal! / games!) >= 9) {
      accoladeList
          .add(accolades.diesAlot(matchHistoryTotals!.deathsTotal! / games!));
    }

    if ((matchHistoryTotals!.baronKillsTotal! / games!) >= 0.5 && games! >= 3) {
      accoladeList.add(
          accolades.baronRaider(matchHistoryTotals!.baronKillsTotal! / games!));
    }

    if ((matchHistoryTotals!.endGameLevelTotal! / games!) >= 15 &&
        matchHistoryTotals!.gameLengthTotal! / games! >= 1600 &&
        games! >= 3) {
      accoladeList.add(accolades
          .lateGameLover(matchHistoryTotals!.endGameLevelTotal! / games!));
    }

    matchHistoryTotals!.gameLengthTotal;

    if ((matchHistoryTotals!.visionScoreTotal! / games!) >= 35 && games! >= 3) {
      accoladeList.add(accolades
          .visionLegend(matchHistoryTotals!.visionScoreTotal! / games!));
    }

    if ((matchHistoryTotals!.visionScoreTotal! / games!) <= 15 && games! >= 3) {
      accoladeList.add(
          accolades.badVision(matchHistoryTotals!.visionScoreTotal! / games!));
    }
    if ((matchHistoryTotals!.damageTotal! / games!) >= 25000 && games! >= 3) {
      accoladeList
          .add(accolades.highDamage(matchHistoryTotals!.damageTotal! / games!));
    }

    if ((matchHistoryTotals!.dmgToStructuresTotal! / games!) >= 5000 &&
        games! >= 3) {
      accoladeList.add(accolades
          .demolisher(matchHistoryTotals!.dmgToStructuresTotal! / games!));
    }
    if ((matchHistoryTotals!.dragonKillsTotal! / games!) >= 0.5 &&
        games! >= 3) {
      accoladeList.add(accolades
          .dragonTamer(matchHistoryTotals!.dragonKillsTotal! / games!));
    }
    if ((matchHistoryTotals!.firstBloodTotal! / games!) >= 0.5 && games! >= 3) {
      accoladeList.add(accolades
          .firstBloodExpert(matchHistoryTotals!.firstBloodTotal! / games!));
    }

    if ((matchHistoryTotals!.objectiveStealTotal! / games!) >= 0.1) {
      accoladeList.add(accolades
          .epicStealer(matchHistoryTotals!.objectiveStealTotal! / games!));
    }
    if ((matchHistoryTotals!.damageTakenOnTeamPercentageTotal! / games!) >=
            0.25 &&
        games! >= 3) {
      accoladeList.add(accolades.tank(
          matchHistoryTotals!.damageTakenOnTeamPercentageTotal! / games!));
    }
    if ((matchHistoryTotals!.turretKillsTotal! / games!) >= 1.0 &&
        games! >= 3) {
      accoladeList.add(accolades
          .turretKiller(matchHistoryTotals!.turretKillsTotal! / games!));
    }
    if ((matchHistoryTotals!.acesBefore15MinutesTotal! / games!) >= 0.5) {
      accoladeList.add(accolades.earlyTeamfighter(
          matchHistoryTotals!.acesBefore15MinutesTotal! / games!));
    }

    if ((matchHistoryTotals!.buffStolenTotal! / games!) >= 1.0 && games! >= 3) {
      accoladeList.add(
          accolades.jungleThief(matchHistoryTotals!.buffStolenTotal! / games!));
    }

    if ((matchHistoryTotals!.damagePerMinuteTotal! / games!) >= 900.0) {
      accoladeList.add(accolades
          .dpsThreat(matchHistoryTotals!.damagePerMinuteTotal! / games!));
    }

    if ((matchHistoryTotals!.dodgeSkillShotsSmallWindowTotal! / games!) >=
        80.0) {
      accoladeList.add(accolades.maxtrixDodger(
          matchHistoryTotals!.dodgeSkillShotsSmallWindowTotal! / games!));
    }

    if ((matchHistoryTotals!.multikillsTotal! / games!) >= 3.0) {
      accoladeList.add(
          accolades.multiKiller(matchHistoryTotals!.multikillsTotal! / games!));
    }

    if ((matchHistoryTotals!.enemyJungleMonsterKillsTotal! / games!) >= 3.0) {
      accoladeList.add(accolades.jungleInvader(
          matchHistoryTotals!.enemyJungleMonsterKillsTotal! / games!));
    }

    if ((matchHistoryTotals!.gameEndedInSurrenderTotal! / games!) >= 4.0) {
      accoladeList.add(accolades.surrender(
          matchHistoryTotals!.gameEndedInSurrenderTotal!.toDouble()));
    }

    if ((matchHistoryTotals!.goldEarnedTotal! / games!) >= 12000 &&
        games! >= 3) {
      accoladeList.add(
          accolades.goldHoarder(matchHistoryTotals!.goldEarnedTotal! / games!));
    }

    if ((matchHistoryTotals!.goldPerMinuteTotal! / games!) >= 800) {
      accoladeList.add(accolades
          .moneyMaker(matchHistoryTotals!.goldPerMinuteTotal! / games!));
    }

    if ((matchHistoryTotals!.hadOpenNexusWinsTotal! / games!) > 0) {
      accoladeList.add(accolades
          .comebackKid(matchHistoryTotals!.hadOpenNexusWinsTotal!.toDouble()));
    }

    if ((matchHistoryTotals!.immobilizeAndKillWithAllyTotal! / games!) >= 10) {
      accoladeList.add(accolades
          .layup(matchHistoryTotals!.immobilizeAndKillWithAllyTotal! / games!));
    }

    if ((matchHistoryTotals!.jungleCsBefore10MinutesTotal! / games!) >= 40 &&
        games! >= 3) {
      accoladeList.add(accolades.powerFarmer(
          matchHistoryTotals!.jungleCsBefore10MinutesTotal! / games!));
    }

    if ((matchHistoryTotals!.killParticipationTotal! / games!) > 0.6) {
      accoladeList.add(accolades
          .kpExpert(matchHistoryTotals!.killParticipationTotal! / games!));
    }

    if ((matchHistoryTotals!.killParticipationTotal! / games!) < 0.2) {
      accoladeList.add(accolades
          .badKp(matchHistoryTotals!.killParticipationTotal! / games!));
    }

    if ((matchHistoryTotals!.killsUnderOwnTurretTotal! / games!) >= 1 &&
        games! >= 3) {
      accoladeList.add(accolades
          .hardToDive(matchHistoryTotals!.killsUnderOwnTurretTotal! / games!));
    }

    if ((matchHistoryTotals!.landSkillShotsEarlyGameTotal! / games!) >= 20) {
      accoladeList.add(accolades.highPrecision(
          matchHistoryTotals!.landSkillShotsEarlyGameTotal! / games!));
    }

    if ((matchHistoryTotals!.laneMinionsFirst10MinutesTotal! / games!) >= 60) {
      accoladeList.add(accolades.goodCS(
          matchHistoryTotals!.laneMinionsFirst10MinutesTotal! / games!));
    }

    if ((matchHistoryTotals!.laneMinionsFirst10MinutesTotal! / games!) <= 20) {
      accoladeList.add(accolades
          .badCS(matchHistoryTotals!.laneMinionsFirst10MinutesTotal! / games!));
    }

    if ((matchHistoryTotals!.legendaryCountTotal! / games!) >= 0.8) {
      accoladeList.add(accolades
          .legendaryGamer(matchHistoryTotals!.legendaryCountTotal! / games!));
    }

    if ((matchHistoryTotals!.maxCsAdvantageOnLaneOpponentTotal! / games!) >=
        50) {
      accoladeList.add(accolades.laneBully(
          matchHistoryTotals!.maxCsAdvantageOnLaneOpponentTotal! / games!));
    }

    if ((matchHistoryTotals!.multiTurretRiftHeraldCountTotal! / games!) >=
            0.5 &&
        games! >= 3) {
      accoladeList.add(accolades.heraldUsage(
          matchHistoryTotals!.multiTurretRiftHeraldCountTotal! / games!));
    }

    if ((matchHistoryTotals!.outnumberedKillsTotal! / games!) >= 2) {
      accoladeList.add(accolades
          .outplayArtist(matchHistoryTotals!.outnumberedKillsTotal! / games!));
    }

    if ((matchHistoryTotals!.quickCleanseTotal! / games!) >= 1) {
      accoladeList.add(accolades
          .cleanseAbuse(matchHistoryTotals!.quickCleanseTotal! / games!));
    }

    if ((matchHistoryTotals!.quickSoloKillsTotal! / games!) >= 2) {
      accoladeList.add(accolades
          .oneshots(matchHistoryTotals!.quickSoloKillsTotal! / games!));
    }

    if ((matchHistoryTotals!.soloKillsTotal! / games!) >= 3) {
      accoladeList.add(
          accolades.soloBolo(matchHistoryTotals!.soloKillsTotal! / games!));
    }

    if ((matchHistoryTotals!.soloBaronKillsTotal! / games!) > 0) {
      accoladeList.add(accolades
          .baronSolo(matchHistoryTotals!.soloBaronKillsTotal!.toDouble()));
    }

    if ((matchHistoryTotals!.saveAllyFromDeathTotal! / games!) >= 0.5 &&
        games! >= 3) {
      accoladeList.add(accolades
          .guardianAngel(matchHistoryTotals!.saveAllyFromDeathTotal! / games!));
    }

    if ((matchHistoryTotals!.scuttleCrabKillsTotal! / games!) >= 1) {
      accoladeList.add(accolades
          .scuttleWarrior(matchHistoryTotals!.scuttleCrabKillsTotal! / games!));
    }

    //error
    matchHistoryTotals!.earlyLaningPhaseGoldExpAdvantageTotal;
    //error

    matchHistoryTotals!.turretPlatesTakenTotal;
    matchHistoryTotals!.alliedJungleMonsterKillsTotal;
    matchHistoryTotals!.multikillsAfterAggressiveFlashTotal;
    matchHistoryTotals!.damageSelfMitigatedTotal;
    matchHistoryTotals!.doubleKillsTotal;
    matchHistoryTotals!.quadraKillsTotal;
    matchHistoryTotals!.pentaKillsTotal;
    matchHistoryTotals!.killAfterHiddenWithAllyTotal;
    matchHistoryTotals!.lostAnInhibitorWinsTotal;
    matchHistoryTotals!.perfectGameTotal;
    matchHistoryTotals!.perfectDragonSoulsTakenTotal;

    accoladeList.sort((a, b) => a.value.compareTo(b.value));

    return Card(
        shadowColor: Colors.blue,
        elevation: 20,
        color: colorGrey,
        child: SizedBox(
          height: 100 * 0.7,
          width: 300 * 0.7,
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 10 * 0.7,
              runSpacing: 15 * 0.7,
              children: accoladeList,
            ),
          ),
        ));
  }
}
