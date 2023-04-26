import 'package:summer_project/util/matchHistoryTotals.dart';

import '../generated-classes/matchByChamp.dart';
import '../generated-classes/matchStats.dart';

class VariableHell {
  List<MatchByChamp> matchByChampList = [];

  //Variabler all games
  int? csTotal = 0;
  int? winsTotal = 0;
  int? lossesTotal = 0;
  int? gamesPlayedTotal = 0;
  int? baronKillsTotal = 0;
  int? killsTotal = 0;
  int? pinkWardsTotal = 0;
  int? endGameLevelTotal = 0;
  int? dmgToStructuresTotal = 0;
  int? deathsTotal = 0;
  int? dragonKillsTotal = 0;
  int? firstBloodTotal = 0;
  int? killingSpreeTotal = 0;
  int? objectiveStealTotal = 0;
  int? pentaKillsTotal = 0;
  int? damageTotal = 0;
  int? damageTakenTotal = 0;
  int? turretKillsTotal = 0;
  int? visionScoreTotal = 0;

  int? turretPlatesTakenTotal = 0;
  int? soloKillsTotal = 0;
  int? soloBaronKillsTotal = 0;
  int? scuttleCrabKillsTotal = 0;
  int? saveAllyFromDeathTotal = 0;
  int? quickSoloKillsTotal = 0;
  int? epicMonsterKillsNearEnemyJunglerTotal = 0;
  double? enemyJungleMonsterKillsTotal = 0;

  double? effectiveHealAndShieldingTotal = 0;

  int? epicMonsterKillsWithin30SecondsOfSpawnTotal = 0;

  double? gameLengthTotal = 0;
  double? goldPerMinuteTotal = 0;
  int? hadOpenNexusWinsTotal = 0;

  double? jungleCsBefore10MinutesTotal = 0;
  int? junglerKillsEarlyJungleTotal = 0;
  double? kdaTotal = 0;

  double? killParticipationTotal = 0;
  int? killsNearEnemyTurretTotal = 0;
  int? killsOnLanersEarlyJungleAsJunglerTotal = 0;
  int? killsOnOtherLanesEarlyJungleAsLanerTotal = 0;
  int? killsUnderOwnTurretTotal = 0;

  int? laneMinionsFirst10MinutesTotal = 0;

  int? legendaryCountTotal = 0;

  int? multiTurretRiftHeraldCountTotal = 0;

  int? multikillsTotal = 0;
  int? outnumberedKillsTotal = 0;
  int? perfectGameTotal = 0;

  int? dodgeSkillShotsSmallWindowTotal = 0;
  double? damageTakenOnTeamPercentageTotal = 0;
  double? damagePerMinuteTotal = 0;

  int? tripleKillsTotal = 0;
  int? inhibitorTakedownsTotal = 0;
  int? totalHealTotal = 0;

  int? neutralMinionsKilledTotal = 0;
  int? quadraKillsTotal = 0;
  int? timePlayedTotal = 0;
  int? gameEndedInSurrenderTotal = 0;
  int? goldEarnedTotal = 0;
  int? firstTowerTotal = 0;

  int? doubleKillsTotal = 0;
  int? assistsTotal = 0;
  int? detectorWardsPlacedTotal = 0;
  int? wardsPlacedTotal = 0;
  int? wardsKilledTotal = 0;
  double? alliedJungleMonsterKillsTotal = 0;
  int? buffStolenTotal = 0;
  double? teamDamagePercentageTotal = 0;

  void resetVariables() {
    csTotal = 0;
    winsTotal = 0;
    lossesTotal = 0;
    gamesPlayedTotal = 0;
    assistsTotal = 0;

    baronKillsTotal = 0;
    killsTotal = 0;
    pinkWardsTotal = 0;
    endGameLevelTotal = 0;
    dmgToStructuresTotal = 0;
    deathsTotal = 0;
    dragonKillsTotal = 0;
    firstBloodTotal = 0;
    killingSpreeTotal = 0;
    objectiveStealTotal = 0;
    pentaKillsTotal = 0;
    damageTotal = 0;
    damageTakenTotal = 0;
    turretKillsTotal = 0;
    visionScoreTotal = 0;
    turretPlatesTakenTotal = 0;
    soloKillsTotal = 0;
    soloBaronKillsTotal = 0;
    scuttleCrabKillsTotal = 0;
    saveAllyFromDeathTotal = 0;
    quickSoloKillsTotal = 0;
    epicMonsterKillsNearEnemyJunglerTotal = 0;
    enemyJungleMonsterKillsTotal = 0;
    effectiveHealAndShieldingTotal = 0;

    epicMonsterKillsWithin30SecondsOfSpawnTotal = 0;

    gameLengthTotal = 0;
    goldPerMinuteTotal = 0;
    hadOpenNexusWinsTotal = 0;

    jungleCsBefore10MinutesTotal = 0;
    junglerKillsEarlyJungleTotal = 0;
    kdaTotal = 0;

    killParticipationTotal = 0;
    killsNearEnemyTurretTotal = 0;
    killsOnLanersEarlyJungleAsJunglerTotal = 0;
    killsOnOtherLanesEarlyJungleAsLanerTotal = 0;
    killsUnderOwnTurretTotal = 0;

    laneMinionsFirst10MinutesTotal = 0;

    legendaryCountTotal = 0;

    multiTurretRiftHeraldCountTotal = 0;

    multikillsTotal = 0;
    outnumberedKillsTotal = 0;
    perfectGameTotal = 0;

    dodgeSkillShotsSmallWindowTotal = 0;
    damageTakenOnTeamPercentageTotal = 0;
    damagePerMinuteTotal = 0;

    tripleKillsTotal = 0;
    inhibitorTakedownsTotal = 0;
    totalHealTotal = 0;

    neutralMinionsKilledTotal = 0;
    quadraKillsTotal = 0;
    timePlayedTotal = 0;
    gameEndedInSurrenderTotal = 0;
    goldEarnedTotal = 0;
    firstTowerTotal = 0;

    doubleKillsTotal = 0;
    assistsTotal = 0;
    detectorWardsPlacedTotal = 0;
    wardsPlacedTotal = 0;
    wardsKilledTotal = 0;
    alliedJungleMonsterKillsTotal = 0;
    buffStolenTotal = 0;
    teamDamagePercentageTotal = 0;
  }

  int incrementNumber(int? number, int numberTotal) {
    if (number != null) {
      numberTotal = numberTotal + number;
    }
    return numberTotal;
  }

  void matchTotals(Participants? player) {
    try {
      if (gamesPlayedTotal != null) {
        gamesPlayedTotal = gamesPlayedTotal! + 1;
      }
      bool? playerWin = player?.win;
      if (playerWin != null && playerWin == true) {
        int? win = 1;
        winsTotal = (winsTotal! + win);
      }
      if (player?.win! == false) {
        int? loss = 1;
        lossesTotal = (lossesTotal! + loss);
      }

      baronKillsTotal = incrementNumber(
          player?.challenges?.baronTakedowns as int?, baronKillsTotal!);
      killsTotal = incrementNumber(player?.kills, killsTotal!);
      pinkWardsTotal =
          incrementNumber(player?.visionWardsBoughtInGame, pinkWardsTotal!);

      endGameLevelTotal =
          incrementNumber(player?.champLevel, endGameLevelTotal!);

      dmgToStructuresTotal = incrementNumber(
          player?.damageDealtToBuildings, dmgToStructuresTotal!);

      deathsTotal = incrementNumber(player?.deaths, deathsTotal!);

      dragonKillsTotal =
          incrementNumber(player?.dragonKills, dragonKillsTotal!);

      bool? firstBloodKill = player?.firstBloodKill;
      if (firstBloodKill != null && firstBloodKill == true) {
        int? firstBlood = 1;
        firstBloodTotal = (firstBloodTotal! + firstBlood);
      } else {
        int? firstBlood = 0;
        firstBloodTotal = (firstBloodTotal! + firstBlood);
      }

      bool? firstBloodAssist = player?.firstBloodAssist;
      if (firstBloodAssist != null && firstBloodAssist == true) {
        int? firstBlood = 1;
        firstBloodTotal = (firstBloodTotal! + firstBlood);
      } else {
        int? firstBlood = 0;
        firstBloodTotal = (firstBloodTotal! + firstBlood);
      }

      killingSpreeTotal =
          incrementNumber(player?.killingSprees, killingSpreeTotal!);

      objectiveStealTotal =
          incrementNumber(player?.objectivesStolen, objectiveStealTotal!);

      pentaKillsTotal = incrementNumber(player?.pentaKills, pentaKillsTotal!);

      damageTotal =
          incrementNumber(player?.totalDamageDealtToChampions, damageTotal!);

      damageTakenTotal =
          incrementNumber(player?.totalDamageTaken, damageTakenTotal!);

      turretKillsTotal =
          incrementNumber(player?.turretKills, turretKillsTotal!);

      visionScoreTotal =
          incrementNumber(player?.visionScore, visionScoreTotal!);

      buffStolenTotal = incrementNumber(
          player?.challenges?.buffsStolen as int?, buffStolenTotal!);

      wardsKilledTotal =
          incrementNumber(player?.wardsKilled, wardsKilledTotal!);

      wardsPlacedTotal =
          incrementNumber(player?.wardsPlaced, wardsPlacedTotal!);

      assistsTotal = incrementNumber(player?.assists, assistsTotal!);

      doubleKillsTotal =
          incrementNumber(player?.doubleKills, doubleKillsTotal!);

      bool? firstTowerKill = player?.firstTowerKill;
      if (firstTowerKill != null && firstTowerKill == true) {
        int? firstTower = 1;
        firstTowerTotal = (firstTowerTotal! + firstTower);
      } else {
        int? firstTower = 0;
        firstTowerTotal = (firstTowerTotal! + firstTower);
      }

      bool? gameEndedInSurrender = player?.gameEndedInSurrender;
      if (gameEndedInSurrender != null && gameEndedInSurrender == true) {
        int? gameEndedInSurrender = 1;
        gameEndedInSurrenderTotal =
            (gameEndedInSurrenderTotal! + gameEndedInSurrender);
      } else {
        int? gameEndedInSurrender = 0;
        gameEndedInSurrenderTotal =
            (gameEndedInSurrenderTotal! + gameEndedInSurrender);
      }

      goldEarnedTotal = incrementNumber(player?.goldEarned, goldEarnedTotal!);

      timePlayedTotal = incrementNumber(player?.timePlayed, timePlayedTotal!);

      quadraKillsTotal =
          incrementNumber(player?.quadraKills, quadraKillsTotal!);

      neutralMinionsKilledTotal = incrementNumber(
          player?.neutralMinionsKilled, neutralMinionsKilledTotal!);

      totalHealTotal = incrementNumber(player?.totalHeal, totalHealTotal!);

      inhibitorTakedownsTotal =
          incrementNumber(player?.inhibitorTakedowns, inhibitorTakedownsTotal!);

      tripleKillsTotal =
          incrementNumber(player?.tripleKills, tripleKillsTotal!);

      num? damagePerMinute = player?.challenges?.damagePerMinute;
      if (damagePerMinute != null) {
        damagePerMinuteTotal = (damagePerMinuteTotal! + damagePerMinute);
      }

      num? damageTakenOnTeamPercentage =
          player?.challenges!.damageTakenOnTeamPercentage;
      if (damageTakenOnTeamPercentage != null) {
        damageTakenOnTeamPercentageTotal =
            (damageTakenOnTeamPercentageTotal! + damageTakenOnTeamPercentage);
      }
      num? dodgeSkillShotsSmallWindow =
          player?.challenges?.dodgeSkillShotsSmallWindow;
      if (dodgeSkillShotsSmallWindow != null) {
        dodgeSkillShotsSmallWindowTotal = (dodgeSkillShotsSmallWindowTotal! +
            dodgeSkillShotsSmallWindow) as int?;
      }

      dodgeSkillShotsSmallWindowTotal = incrementNumber(
          player?.challenges?.dodgeSkillShotsSmallWindow as int?,
          dodgeSkillShotsSmallWindowTotal!);

      num? effectiveHealAndShielding =
          player?.challenges?.effectiveHealAndShielding;
      if (effectiveHealAndShielding != null) {
        effectiveHealAndShieldingTotal =
            (effectiveHealAndShieldingTotal! + effectiveHealAndShielding);
      }
      num? enemyJungleMonsterKills =
          player?.challenges?.enemyJungleMonsterKills;
      if (enemyJungleMonsterKills != null) {
        enemyJungleMonsterKillsTotal =
            (enemyJungleMonsterKillsTotal! + enemyJungleMonsterKills);
      }
      epicMonsterKillsNearEnemyJunglerTotal = incrementNumber(
          player?.challenges?.epicMonsterKillsNearEnemyJungler as int?,
          epicMonsterKillsNearEnemyJunglerTotal!);

      epicMonsterKillsWithin30SecondsOfSpawnTotal = incrementNumber(
          player?.challenges?.epicMonsterKillsWithin30SecondsOfSpawn as int?,
          epicMonsterKillsWithin30SecondsOfSpawnTotal!);

      double? gameLength = player?.challenges?.gameLength;
      if (gameLength != null) {
        gameLengthTotal = (gameLengthTotal! + gameLength);
      }

      double? goldPerMinute = player?.challenges?.goldPerMinute;
      if (goldPerMinute != null) {
        goldPerMinuteTotal = (goldPerMinuteTotal! + goldPerMinute);
      }

      num? hadOpenNexus = player?.challenges?.hadOpenNexus;
      if ((hadOpenNexus != null && hadOpenNexus >= 1) &&
          playerWin != null &&
          playerWin == true) {
        int? hadOpenNexusWins = 1;
        hadOpenNexusWinsTotal = (hadOpenNexusWinsTotal! + hadOpenNexusWins);
      }

      num? jungleCsBefore10Minutes =
          player?.challenges?.jungleCsBefore10Minutes;
      if (jungleCsBefore10Minutes != null) {
        jungleCsBefore10MinutesTotal =
            (jungleCsBefore10MinutesTotal! + jungleCsBefore10Minutes);
      }

      num? kda = player?.challenges?.kda;
      if (kda != null) {
        kdaTotal = (kdaTotal! + kda);
      }

      num? killParticipation = player?.challenges?.killParticipation;
      if (killParticipation != null) {
        killParticipationTotal = (killParticipationTotal! + killParticipation);
      }

      killsNearEnemyTurretTotal = incrementNumber(
          player?.challenges?.killsNearEnemyTurret as int?,
          killsNearEnemyTurretTotal!);
      killsUnderOwnTurretTotal = incrementNumber(
          player?.challenges?.killsUnderOwnTurret as int?,
          killsUnderOwnTurretTotal!);
      laneMinionsFirst10MinutesTotal = incrementNumber(
          player?.challenges?.laneMinionsFirst10Minutes as int?,
          laneMinionsFirst10MinutesTotal!);
      legendaryCountTotal = incrementNumber(
          player?.challenges?.legendaryCount as int?, legendaryCountTotal!);

      multiTurretRiftHeraldCountTotal = incrementNumber(
          player?.challenges?.multiTurretRiftHeraldCount as int?,
          multiTurretRiftHeraldCountTotal!);
      multiTurretRiftHeraldCountTotal = incrementNumber(
          player?.challenges?.multiTurretRiftHeraldCount as int?,
          multiTurretRiftHeraldCountTotal!);
      multikillsTotal = incrementNumber(
          player?.challenges?.multikills as int?, multikillsTotal!);
      outnumberedKillsTotal = incrementNumber(
          player?.challenges?.outnumberedKills as int?, outnumberedKillsTotal!);
      perfectGameTotal = incrementNumber(
          player?.challenges?.perfectGame as int?, perfectGameTotal!);
      quickSoloKillsTotal = incrementNumber(
          player?.challenges?.quickSoloKills as int?, quickSoloKillsTotal!);
      saveAllyFromDeathTotal = incrementNumber(
          player?.challenges?.saveAllyFromDeath as int?,
          saveAllyFromDeathTotal!);
      scuttleCrabKillsTotal = incrementNumber(
          player?.challenges?.scuttleCrabKills as int?, scuttleCrabKillsTotal!);
      soloBaronKillsTotal = incrementNumber(
          player?.challenges?.soloBaronKills as int?, soloBaronKillsTotal!);
      soloKillsTotal = incrementNumber(
          player?.challenges?.soloKills as int?, soloKillsTotal!);
      turretPlatesTakenTotal = incrementNumber(
          player?.challenges?.turretPlatesTaken as int?,
          turretPlatesTakenTotal!);
      num? teamDamagePercentage = player?.challenges?.teamDamagePercentage;
      if (teamDamagePercentage != null) {
        teamDamagePercentageTotal =
            (teamDamagePercentageTotal! + teamDamagePercentage);
      }

      int? csPlusJungle =
          player!.totalMinionsKilled! + (player.neutralMinionsKilled as int);
      csTotal = incrementNumber(csPlusJungle, csTotal!);
    } catch (e) {
      print(e);
    }
  }
}
