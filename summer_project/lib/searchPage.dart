import 'dart:collection';
import 'dart:io';

import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/game.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:dart_lol/dart_lol.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:summer_project/apiMethods.dart';
import 'package:summer_project/main.dart';
import 'package:http/http.dart' as http;
import 'package:summer_project/matchByChamp.dart';
import 'package:summer_project/matchHistoryTotals.dart';
import 'dart:convert';

import 'package:summer_project/matchStats.dart';
import 'package:summer_project/slides.dart';

String apiToken = "joel";

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String server = "EUW1";
  final summonerTextController = TextEditingController();
  List<Game>? gameList;
  List<MatchStats>? matchHistoryList;
  List<String>? champNames = [];
  List<MatchByChamp> matchByChampList = [];

  List<String>? laneNames = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void matchTotals(Participants? player) {
    try {
      //print(player!.challenges!.gameLength);
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

      int? baronKills = player?.challenges?.baronTakedowns;
      if (baronKills != null) {
        baronKillsTotal = (baronKillsTotal! + baronKills);
      }
      int? kills = player?.kills;
      if (kills != null) {
        killsTotal = (killsTotal! + kills);
      }
      int? pinkWards = player?.visionWardsBoughtInGame;
      if (pinkWards != null) {
        pinkWardsTotal = (pinkWardsTotal! + pinkWards);
      }
      int? endGameLevel = player?.champLevel;
      if (endGameLevel != null) {
        endGameLevelTotal = (endGameLevelTotal! + endGameLevel);
      }
      int? dmgToStructures = player?.damageDealtToBuildings;
      if (dmgToStructures != null) {
        dmgToStructuresTotal = (dmgToStructuresTotal! + dmgToStructures);
      }
      int? deaths = player?.deaths;
      if (deaths != null) {
        deathsTotal = (deathsTotal! + deaths);
      }
      int? dragonKills = player?.dragonKills;
      if (dragonKills != null) {
        dragonKillsTotal = (dragonKillsTotal! + dragonKills);
      }
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
      int? killingSprees = player?.killingSprees;
      if (killingSprees != null) {
        killingSpreeTotal = (killingSpreeTotal! + killingSprees);
      }
      int? objectiveSteal = player?.objectivesStolen;
      if (objectiveSteal != null) {
        objectiveStealTotal = (objectiveStealTotal! + objectiveSteal);
      }
      int? pentaKills = player?.pentaKills;
      if (pentaKills != null) {
        pentaKillsTotal = (pentaKillsTotal! + pentaKills);
      }
      int? damage = player?.totalDamageDealtToChampions;
      if (damage != null) {
        damageTotal = (damageTotal! + damage);
      }
      int? damageTaken = player?.totalDamageTaken;
      if (damageTaken != null) {
        damageTakenTotal = (damageTakenTotal! + damageTaken);
      }
      int? turretKills = player?.turretKills;
      if (turretKills != null) {
        turretKillsTotal = (turretKillsTotal! + turretKills);
      }
      int? visionScore = player?.visionScore;
      if (visionScore != null) {
        visionScoreTotal = (visionScoreTotal! + visionScore);
      }
      int? buffStolen = player?.challenges?.buffsStolen;
      if (buffStolen != null) {
        buffStolenTotal = (buffStolenTotal! + buffStolen);
      }
      double? alliedJungleMonsterKills =
          player?.challenges?.alliedJungleMonsterKills;
      if (alliedJungleMonsterKills != null) {
        alliedJungleMonsterKillsTotal =
            (alliedJungleMonsterKillsTotal! + alliedJungleMonsterKills);
      }
      int? wardsKilled = player?.wardsKilled;
      if (wardsKilled != null) {
        wardsKilledTotal = (wardsKilledTotal! + wardsKilled);
      }
      int? wardsPlaced = player?.wardsPlaced;
      if (wardsPlaced != null) {
        wardsPlacedTotal = (wardsPlacedTotal! + wardsPlaced);
      }
      int? detectorWardsPlaced = player?.detectorWardsPlaced;
      if (detectorWardsPlaced != null) {
        detectorWardsPlacedTotal =
            (detectorWardsPlacedTotal! + detectorWardsPlaced);
      }
      int? assists = player?.assists;
      if (assists != null) {
        assistsTotal = (assistsTotal! + assists);
      }
      int? doubleKills = player?.doubleKills;
      if (doubleKills != null) {
        doubleKillsTotal = (doubleKillsTotal! + doubleKills);
      }
      int? damageSelfMitigated = player?.damageSelfMitigated;
      if (damageSelfMitigated != null) {
        damageSelfMitigatedTotal =
            (damageSelfMitigatedTotal! + damageSelfMitigated);
      }
      bool? firstTowerAssist = player?.firstTowerAssist;
      if (firstTowerAssist != null && firstTowerAssist == true) {
        int? firstTower = 1;
        firstTowerTotal = (firstTowerTotal! + firstTower);
      } else {
        int? firstTower = 0;
        firstTowerTotal = (firstTowerTotal! + firstTower);
      }
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
      //player.individualPosition;
      int? goldEarned = player?.goldEarned;
      if (goldEarned != null) {
        goldEarnedTotal = (goldEarnedTotal! + goldEarned);
      }
      int? timePlayed = player?.timePlayed;
      if (timePlayed != null) {
        timePlayedTotal = (timePlayedTotal! + timePlayed);
      }

      int? quadraKills = player?.quadraKills;
      if (quadraKills != null) {
        quadraKillsTotal = (quadraKillsTotal! + quadraKills);
      }
      int? neutralMinionsKilled = player?.neutralMinionsKilled;
      if (neutralMinionsKilled != null) {
        neutralMinionsKilledTotal =
            (neutralMinionsKilledTotal! + neutralMinionsKilled);
      }
      int? timeCCingOthers = player?.timeCCingOthers;
      if (timeCCingOthers != null) {
        timeCCingOthersTotal = (timeCCingOthersTotal! + timeCCingOthers);
      }
      int? totalHeal = player?.totalHeal;
      if (totalHeal != null) {
        totalHealTotal = (totalHealTotal! + totalHeal);
      }
      int? inhibitorTakedowns = player?.inhibitorTakedowns;
      if (inhibitorTakedowns != null) {
        inhibitorTakedownsTotal =
            (inhibitorTakedownsTotal! + inhibitorTakedowns);
      }
      int? tripleKills = player?.tripleKills;
      if (tripleKills != null) {
        tripleKillsTotal = (tripleKillsTotal! + tripleKills);
      }
      int? acesBefore15Minutes = player?.challenges?.acesBefore15Minutes;
      if (acesBefore15Minutes != null) {
        acesBefore15MinutesTotal =
            (acesBefore15MinutesTotal! + acesBefore15Minutes);
      }

      double? damagePerMinute = player?.challenges?.damagePerMinute;
      if (damagePerMinute != null) {
        damagePerMinuteTotal = (damagePerMinuteTotal! + damagePerMinute);
      }
      double? damageTakenOnTeamPercentage =
          player?.challenges!.damageTakenOnTeamPercentage;
      if (damageTakenOnTeamPercentage != null) {
        damageTakenOnTeamPercentageTotal =
            (damageTakenOnTeamPercentageTotal! + damageTakenOnTeamPercentage);
      }
      int? dodgeSkillShotsSmallWindow =
          player?.challenges?.dodgeSkillShotsSmallWindow;
      if (dodgeSkillShotsSmallWindow != null) {
        dodgeSkillShotsSmallWindowTotal =
            (dodgeSkillShotsSmallWindowTotal! + dodgeSkillShotsSmallWindow);
      }
/*
    double? earliestBaron = player.challenges!.earliestBaron;
    if (earliestBaron! < earliestBaronRecord!) {
      earliestBaronRecord = earliestBaron;
    } else {
      earliestBaronRecord = earliestBaronRecord;
    }
    */
      //ram !!!!!!!!
      double? effectiveHealAndShielding =
          player?.challenges?.effectiveHealAndShielding;
      if (effectiveHealAndShielding != null) {
        effectiveHealAndShieldingTotal =
            (effectiveHealAndShieldingTotal! + effectiveHealAndShielding);
      }
/*
    int? earlyLaningPhaseGoldExpAdvantage =
        player.challenges!.earlyLaningPhaseGoldExpAdvantage;
    earlyLaningPhaseGoldExpAdvantageTotal =
        (earlyLaningPhaseGoldExpAdvantageTotal! +
            earlyLaningPhaseGoldExpAdvantage!);
            */
      double? enemyJungleMonsterKills =
          player?.challenges?.enemyJungleMonsterKills;
      if (enemyJungleMonsterKills != null) {
        enemyJungleMonsterKillsTotal =
            (enemyJungleMonsterKillsTotal! + enemyJungleMonsterKills);
      }
      int? epicMonsterKillsNearEnemyJungler =
          player?.challenges?.epicMonsterKillsNearEnemyJungler;
      if (epicMonsterKillsNearEnemyJungler != null) {
        epicMonsterKillsNearEnemyJunglerTotal =
            (epicMonsterKillsNearEnemyJunglerTotal! +
                epicMonsterKillsNearEnemyJungler);
      }
      int? epicMonsterKillsWithin30SecondsOfSpawn =
          player?.challenges?.epicMonsterKillsWithin30SecondsOfSpawn;
      if (epicMonsterKillsWithin30SecondsOfSpawn != null) {
        epicMonsterKillsWithin30SecondsOfSpawnTotal =
            (epicMonsterKillsWithin30SecondsOfSpawnTotal! +
                epicMonsterKillsWithin30SecondsOfSpawn);
      }
/*
    int? fasterSupportQuestCompletion =
        player.challenges!.fasterSupportQuestCompletion;
    fasterSupportQuestCompletionTotal =
        (fasterSupportQuestCompletionTotal! + fasterSupportQuestCompletion!);
        */
/*
    double? firstTurretKilledTime = player.challenges!.firstTurretKilledTime;
    if (firstTurretKilledTime! < firstTurretKilledTimeRecord!) {
      firstTurretKilledTimeRecord = firstTurretKilledTime;
    } else {
      firstTurretKilledTimeRecord = firstTurretKilledTimeRecord;
    }
    */
      double? gameLength = player?.challenges?.gameLength;
      if (gameLength != null) {
        gameLengthTotal = (gameLengthTotal! + gameLength);
      }
      double? goldPerMinute = player?.challenges?.goldPerMinute;
      if (goldPerMinute != null) {
        goldPerMinuteTotal = (goldPerMinuteTotal! + goldPerMinute);
      }
      int? hadOpenNexus = player?.challenges?.hadOpenNexus;
      if ((hadOpenNexus != null && hadOpenNexus >= 1) &&
          playerWin != null &&
          playerWin == true) {
        int? hadOpenNexusWins = 1;
        hadOpenNexusWinsTotal = (hadOpenNexusWinsTotal! + hadOpenNexusWins);
      }
      //player.challenges!.highestChampionDamage;
      int? immobilizeAndKillWithAlly =
          player?.challenges?.immobilizeAndKillWithAlly;
      if (immobilizeAndKillWithAlly != null) {
        immobilizeAndKillWithAllyTotal =
            (immobilizeAndKillWithAllyTotal! + immobilizeAndKillWithAlly);
      }
      double? jungleCsBefore10Minutes =
          player?.challenges?.jungleCsBefore10Minutes;
      if (jungleCsBefore10Minutes != null) {
        jungleCsBefore10MinutesTotal =
            (jungleCsBefore10MinutesTotal! + jungleCsBefore10Minutes);
      }
      /*
    int? junglerKillsEarlyJungle = player.challenges!.junglerKillsEarlyJungle;
    junglerKillsEarlyJungleTotal =
        (junglerKillsEarlyJungleTotal! + junglerKillsEarlyJungle!);
        */
      double? kda = player?.challenges?.kda;
      if (kda != null) {
        kdaTotal = (kdaTotal! + kda);
      }
      int? killAfterHiddenWithAlly =
          player?.challenges?.killAfterHiddenWithAlly;
      if (killAfterHiddenWithAlly != null) {
        killAfterHiddenWithAllyTotal =
            (killAfterHiddenWithAllyTotal! + killAfterHiddenWithAlly);
      }
      double? killParticipation = player?.challenges?.killParticipation;
      if (killParticipation != null) {
        killParticipationTotal = (killParticipationTotal! + killParticipation);
      }
      int? killsNearEnemyTurret = player?.challenges?.killsNearEnemyTurret;
      if (killsNearEnemyTurret != null) {
        killsNearEnemyTurretTotal =
            (killsNearEnemyTurretTotal! + killsNearEnemyTurret);
      }
/*
    int? killsOnLanersEarlyJungleAsJungler =
        player.challenges!.killsOnLanersEarlyJungleAsJungler;
    killsOnLanersEarlyJungleAsJunglerTotal =
        (killsOnLanersEarlyJungleAsJunglerTotal! +
            killsOnLanersEarlyJungleAsJungler!);
            */
      /*
    int? killsOnOtherLanesEarlyJungleAsLaner =
        player.challenges!.killsOnOtherLanesEarlyJungleAsLaner;
    killsOnOtherLanesEarlyJungleAsLanerTotal =
        (killsOnOtherLanesEarlyJungleAsLanerTotal! +
            killsOnOtherLanesEarlyJungleAsLaner!);
            */
      int? killsUnderOwnTurret = player?.challenges?.killsUnderOwnTurret;
      if (killsUnderOwnTurret != null) {
        killsUnderOwnTurretTotal =
            (killsUnderOwnTurretTotal! + killsUnderOwnTurret);
      }
      int? landSkillShotsEarlyGame =
          player?.challenges?.landSkillShotsEarlyGame;
      if (landSkillShotsEarlyGame != null) {
        landSkillShotsEarlyGameTotal =
            (landSkillShotsEarlyGameTotal! + landSkillShotsEarlyGame);
      }
      int? laneMinionsFirst10Minutes =
          player?.challenges?.laneMinionsFirst10Minutes;
      if (laneMinionsFirst10Minutes != null) {
        laneMinionsFirst10MinutesTotal =
            (laneMinionsFirst10MinutesTotal! + laneMinionsFirst10Minutes);
      }
      /*  
    double? maxCsAdvantageOnLaneOpponent =
        player.challenges!.maxCsAdvantageOnLaneOpponent;
    maxCsAdvantageOnLaneOpponentTotal =
        (maxCsAdvantageOnLaneOpponentTotal! + maxCsAdvantageOnLaneOpponent!);
        */

      //player.challenges!.maxKillDeficit;
      //player.win;
      int? legendaryCount = player?.challenges?.legendaryCount;
      if (legendaryCount != null) {
        legendaryCountTotal = (legendaryCountTotal! + legendaryCount);
      }

      int? lostAnInhibitor = player?.challenges?.lostAnInhibitor;
      if ((lostAnInhibitor != null && lostAnInhibitor >= 1) &&
          playerWin != null &&
          playerWin == true) {
        int? lostAnInhibitorWins = 1;
        lostAnInhibitorWinsTotal =
            (lostAnInhibitorWinsTotal! + lostAnInhibitorWins);
      }

      int? multiTurretRiftHeraldCount =
          player?.challenges?.multiTurretRiftHeraldCount;
      if (multiTurretRiftHeraldCount != null) {
        multiTurretRiftHeraldCountTotal =
            (multiTurretRiftHeraldCountTotal! + multiTurretRiftHeraldCount);
      }
      int? perfectDragonSoulsTaken =
          player?.challenges?.perfectDragonSoulsTaken;
      if (perfectDragonSoulsTaken != null) {
        perfectDragonSoulsTakenTotal =
            (perfectDragonSoulsTakenTotal! + perfectDragonSoulsTaken);
      }
      int? multikillsAfterAggressiveFlash =
          player?.challenges?.multikillsAfterAggressiveFlash;
      if (multikillsAfterAggressiveFlash != null) {
        multikillsAfterAggressiveFlashTotal =
            (multikillsAfterAggressiveFlashTotal! +
                multikillsAfterAggressiveFlash);
      }
      int? multikills = player?.challenges?.multikills;
      if (multikills != null) {
        multikillsTotal = (multikillsTotal! + multikills);
      }
      int? outnumberedKills = player?.challenges?.outnumberedKills;
      if (outnumberedKills != null) {
        outnumberedKillsTotal = (outnumberedKillsTotal! + outnumberedKills);
      }
      int? perfectGame = player?.challenges?.perfectGame;
      if (perfectGame != null) {
        perfectGameTotal = (perfectGameTotal! + perfectGame);
      }
      int? quickCleanse = player?.challenges?.quickCleanse;
      if (quickCleanse != null) {
        quickCleanseTotal = (quickCleanseTotal! + quickCleanse);
      }
      int? quickSoloKills = player?.challenges?.quickSoloKills;
      if (quickSoloKills != null) {
        quickSoloKillsTotal = (quickSoloKillsTotal! + quickSoloKills);
      }
      int? saveAllyFromDeath = player?.challenges?.saveAllyFromDeath;
      if (saveAllyFromDeath != null) {
        saveAllyFromDeathTotal = (saveAllyFromDeathTotal! + saveAllyFromDeath);
      }
      int? scuttleCrabKills = player?.challenges?.scuttleCrabKills;
      if (scuttleCrabKills != null) {
        scuttleCrabKillsTotal = (scuttleCrabKillsTotal! + scuttleCrabKills);
      }
      int? soloBaronKills = player?.challenges?.soloBaronKills;
      if (soloBaronKills != null) {
        soloBaronKillsTotal = (soloBaronKillsTotal! + soloBaronKills);
      }
      int? soloKills = player?.challenges?.soloKills;
      if (soloKills != null) {
        soloKillsTotal = (soloKillsTotal! + soloKills);
      }
      int? turretPlatesTaken = player?.challenges?.turretPlatesTaken;
      if (turretPlatesTaken != null) {
        turretPlatesTakenTotal = (turretPlatesTakenTotal! + turretPlatesTaken);
      }
      double? teamDamagePercentage = player?.challenges?.teamDamagePercentage;
      if (teamDamagePercentage != null) {
        teamDamagePercentageTotal =
            (teamDamagePercentageTotal! + teamDamagePercentage);
      }
      int? wardsGuarded = player?.challenges?.wardsGuarded;
      if (wardsGuarded != null) {
        wardsGuardedTotal = (wardsGuardedTotal! + wardsGuarded);
      }

      int? cs = player?.totalMinionsKilled;
      if (cs != null) {
        csTotal = (csTotal! + cs);
      }
    } catch (e) {
      print("Something ");
    }
  }

  Future<List<MatchStats>?> getGameHistory(
      {String? summonerName,
      String? puuid,
      int start = 0,
      int count = 30}) async {
    String europe = "europe";
    var url =
        'https://$europe.api.riotgames.com/lol/match/v5/matches/by-puuid/$puuid/ids?start=$start&count=$count&api_key=$apiToken';
    var response = await http.get(
      Uri.parse(url),
    );
    final matchIdList = json.decode(response.body);
    print(matchIdList);
    List<MatchStats>? matchHistoryList = [];
    for (String id in matchIdList) {
      var url =
          'https://$europe.api.riotgames.com/lol/match/v5/matches/$id?api_key=$apiToken';
      var response = await http.get(
        Uri.parse(url),
      );
      final match = json.decode(response.body);
      ApiMethods apiMethods = ApiMethods();

      final matchStats = MatchStats.fromJson(json.decode(json.encode(match)));

      Participants? player = matchStats.info?.participants?[await apiMethods
          .findPersonUsingLoop(matchStats.info?.participants, summonerName)];

      if (player != null) {
        String? champName = player.championName;
        String? lane = player.individualPosition;
        //print(lane);

        if (champName != null) {
          champNames?.add(champName);
        }

        if (matchStats.info?.queueId == 400 ||
            matchStats.info?.queueId == 420 ||
            matchStats.info?.queueId == 440) {
          laneNames?.add(lane!);
        }

        matchTotals(player);
        MatchByChamp matchByChamp = MatchByChamp(player.championName, player);
        matchByChampList.add(matchByChamp);
      }

      matchHistoryList.add(matchStats);
    }

    return matchHistoryList;
  }

  void onDonePress() {
// Do what you want
  }

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
    wardsGuardedTotal = 0;
    turretPlatesTakenTotal = 0;
    soloKillsTotal = 0;
    soloBaronKillsTotal = 0;
    scuttleCrabKillsTotal = 0;
    saveAllyFromDeathTotal = 0;
    quickSoloKillsTotal = 0;
    epicMonsterKillsNearEnemyJunglerTotal = 0;
    enemyJungleMonsterKillsTotal = 0;
    earlyLaningPhaseGoldExpAdvantageTotal = 0;
    effectiveHealAndShieldingTotal = 0;
    earliestBaronRecord = 0;
    epicMonsterKillsWithin30SecondsOfSpawnTotal = 0;
    fasterSupportQuestCompletionTotal = 0;
    firstTurretKilledTimeRecord = 0;
    gameLengthTotal = 0;
    goldPerMinuteTotal = 0;
    hadOpenNexusWinsTotal = 0;
    immobilizeAndKillWithAllyTotal = 0;
    jungleCsBefore10MinutesTotal = 0;
    junglerKillsEarlyJungleTotal = 0;
    kdaTotal = 0;
    killAfterHiddenWithAllyTotal = 0;
    killParticipationTotal = 0;
    killsNearEnemyTurretTotal = 0;
    killsOnLanersEarlyJungleAsJunglerTotal = 0;
    killsOnOtherLanesEarlyJungleAsLanerTotal = 0;
    killsUnderOwnTurretTotal = 0;
    landSkillShotsEarlyGameTotal = 0;
    laneMinionsFirst10MinutesTotal = 0;
    maxCsAdvantageOnLaneOpponentTotal = 0;
    legendaryCountTotal = 0;
    lostAnInhibitorWinsTotal = 0;
    multiTurretRiftHeraldCountTotal = 0;
    perfectDragonSoulsTakenTotal = 0;
    multikillsAfterAggressiveFlashTotal = 0;
    multikillsTotal = 0;
    outnumberedKillsTotal = 0;
    perfectGameTotal = 0;
    quickCleanseTotal = 0;
    dodgeSkillShotsSmallWindowTotal = 0;
    damageTakenOnTeamPercentageTotal = 0;
    damagePerMinuteTotal = 0;
    acesBefore15MinutesTotal = 0;
    tripleKillsTotal = 0;
    inhibitorTakedownsTotal = 0;
    totalHealTotal = 0;
    timeCCingOthersTotal = 0;
    neutralMinionsKilledTotal = 0;
    quadraKillsTotal = 0;
    timePlayedTotal = 0;
    gameEndedInSurrenderTotal = 0;
    goldEarnedTotal = 0;
    firstTowerTotal = 0;
    damageSelfMitigatedTotal = 0;
    doubleKillsTotal = 0;
    assistsTotal = 0;
    detectorWardsPlacedTotal = 0;
    wardsPlacedTotal = 0;
    wardsKilledTotal = 0;
    alliedJungleMonsterKillsTotal = 0;
    buffStolenTotal = 0;
    teamDamagePercentageTotal = 0;
  }

  List<dynamic> getMapString(List<String>? list) {
    var map = Map();
    list!.forEach((e) => map.update(e, (x) => x + 1, ifAbsent: () => 1));

    var sortedKeys = map.keys.toList(growable: false)
      ..sort((k1, k2) => map[k2].compareTo(map[k1]));
    LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => map[k]);
    var sortedList = sortedMap.keys.toList();
    return sortedList;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? IntroSlider(
              slides: slides,
              onDonePress: onDonePress,
            )
          : Container(
              color: colorDarkGrey,
              height: size.height,
              width: size.width,
              child: Center(
                child: Container(
                  width: size.width * 0.6,
                  child: TextField(
                    onSubmitted: (value) async {
                      await onTapLoad();
                    },
                    autofocus: true,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                    controller: summonerTextController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefix: DropdownButton(
                          value: server,
                          onChanged: (String? newValue) {
                            setState(() {
                              server = newValue!;
                            });
                          },
                          items: dropdownItems),
                      suffixIcon: InkWell(
                        child: GlowIcon(
                          Icons.search,
                          color: Colors.blue,
                          glowColor: Colors.blue,
                          size: 50,
                        ),
                        onTap: () async {
                          await onTapLoad();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

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
  int? wardsGuardedTotal = 0;
  int? turretPlatesTakenTotal = 0;
  int? soloKillsTotal = 0;
  int? soloBaronKillsTotal = 0;
  int? scuttleCrabKillsTotal = 0;
  int? saveAllyFromDeathTotal = 0;
  int? quickSoloKillsTotal = 0;
  int? epicMonsterKillsNearEnemyJunglerTotal = 0;
  double? enemyJungleMonsterKillsTotal = 0;
  int? earlyLaningPhaseGoldExpAdvantageTotal = 0;
  double? effectiveHealAndShieldingTotal = 0;
  double? earliestBaronRecord = 0;
  int? epicMonsterKillsWithin30SecondsOfSpawnTotal = 0;
  int? fasterSupportQuestCompletionTotal = 0;
  double? firstTurretKilledTimeRecord = 0;
  double? gameLengthTotal = 0;
  double? goldPerMinuteTotal = 0;
  int? hadOpenNexusWinsTotal = 0;
  int? immobilizeAndKillWithAllyTotal = 0;
  double? jungleCsBefore10MinutesTotal = 0;
  int? junglerKillsEarlyJungleTotal = 0;
  double? kdaTotal = 0;
  int? killAfterHiddenWithAllyTotal = 0;
  double? killParticipationTotal = 0;
  int? killsNearEnemyTurretTotal = 0;
  int? killsOnLanersEarlyJungleAsJunglerTotal = 0;
  int? killsOnOtherLanesEarlyJungleAsLanerTotal = 0;
  int? killsUnderOwnTurretTotal = 0;
  int? landSkillShotsEarlyGameTotal = 0;
  int? laneMinionsFirst10MinutesTotal = 0;
  double? maxCsAdvantageOnLaneOpponentTotal = 0;
  int? legendaryCountTotal = 0;
  int? lostAnInhibitorWinsTotal = 0;
  int? multiTurretRiftHeraldCountTotal = 0;
  int? perfectDragonSoulsTakenTotal = 0;
  int? multikillsAfterAggressiveFlashTotal = 0;
  int? multikillsTotal = 0;
  int? outnumberedKillsTotal = 0;
  int? perfectGameTotal = 0;
  int? quickCleanseTotal = 0;
  int? dodgeSkillShotsSmallWindowTotal = 0;
  double? damageTakenOnTeamPercentageTotal = 0;
  double? damagePerMinuteTotal = 0;
  int? acesBefore15MinutesTotal = 0;
  int? tripleKillsTotal = 0;
  int? inhibitorTakedownsTotal = 0;
  int? totalHealTotal = 0;
  int? timeCCingOthersTotal = 0;
  int? neutralMinionsKilledTotal = 0;
  int? quadraKillsTotal = 0;
  int? timePlayedTotal = 0;
  int? gameEndedInSurrenderTotal = 0;
  int? goldEarnedTotal = 0;
  int? firstTowerTotal = 0;
  int? damageSelfMitigatedTotal = 0;
  int? doubleKillsTotal = 0;
  int? assistsTotal = 0;
  int? detectorWardsPlacedTotal = 0;
  int? wardsPlacedTotal = 0;
  int? wardsKilledTotal = 0;
  double? alliedJungleMonsterKillsTotal = 0;
  int? buffStolenTotal = 0;
  double? teamDamagePercentageTotal = 0;

  Future<void> onTapLoad() async {
    final league = League(apiToken: apiToken, server: server);
    var summoner =
        await league.getSummonerInfo(summonerName: summonerTextController.text);

    if (summoner.puuid != null) {
      print(summoner.puuid);
      setState(() {
        isLoading = true;
      });
      ApiMethods apiMethods = ApiMethods();
      String? accID = summoner.accID;
      int? level = summoner.level;
      int? profileIconID = summoner.profileIconID;
      String? puuid = summoner.puuid;
      String? summmonerID = summoner.summonerID;
      String? summonerName = summoner.summonerName;
      Rank? ranksoloQ = await apiMethods.getRankInfos(summonerID: summmonerID);
      Rank? rankFlex = await apiMethods.getRankInfos2(summonerID: summmonerID);

      List<ChampionMastery>? masteryList =
          await league.getChampionMasteries(summonerID: summmonerID);

      List<MatchStats>? matchHistory = await getGameHistory(
        summonerName: summonerName,
        puuid: summoner.puuid,
      );

      MatchHistoryTotals matchHistoryTotals = MatchHistoryTotals(
          baronKillsTotal!,
          killsTotal!,
          pinkWardsTotal!,
          endGameLevelTotal!,
          dmgToStructuresTotal!,
          deathsTotal!,
          dragonKillsTotal!,
          firstBloodTotal!,
          killingSpreeTotal!,
          objectiveStealTotal!,
          pentaKillsTotal!,
          damageTotal!,
          damageTakenTotal!,
          turretKillsTotal!,
          visionScoreTotal!,
          wardsGuardedTotal!,
          turretPlatesTakenTotal!,
          soloKillsTotal!,
          soloBaronKillsTotal!,
          scuttleCrabKillsTotal!,
          saveAllyFromDeathTotal!,
          quickSoloKillsTotal!,
          epicMonsterKillsNearEnemyJunglerTotal!,
          enemyJungleMonsterKillsTotal!,
          earlyLaningPhaseGoldExpAdvantageTotal!,
          effectiveHealAndShieldingTotal!,
          earliestBaronRecord!,
          epicMonsterKillsWithin30SecondsOfSpawnTotal!,
          fasterSupportQuestCompletionTotal!,
          firstTurretKilledTimeRecord!,
          gameLengthTotal!,
          goldPerMinuteTotal!,
          hadOpenNexusWinsTotal!,
          immobilizeAndKillWithAllyTotal!,
          jungleCsBefore10MinutesTotal!,
          junglerKillsEarlyJungleTotal!,
          kdaTotal!,
          killAfterHiddenWithAllyTotal!,
          killParticipationTotal!,
          killsNearEnemyTurretTotal!,
          killsOnLanersEarlyJungleAsJunglerTotal!,
          killsOnOtherLanesEarlyJungleAsLanerTotal!,
          killsUnderOwnTurretTotal!,
          landSkillShotsEarlyGameTotal!,
          laneMinionsFirst10MinutesTotal!,
          maxCsAdvantageOnLaneOpponentTotal!,
          legendaryCountTotal!,
          lostAnInhibitorWinsTotal!,
          multiTurretRiftHeraldCountTotal!,
          perfectDragonSoulsTakenTotal!,
          multikillsAfterAggressiveFlashTotal!,
          multikillsTotal!,
          outnumberedKillsTotal!,
          perfectGameTotal!,
          quickCleanseTotal!,
          dodgeSkillShotsSmallWindowTotal!,
          damageTakenOnTeamPercentageTotal!,
          damagePerMinuteTotal!,
          acesBefore15MinutesTotal!,
          tripleKillsTotal!,
          inhibitorTakedownsTotal!,
          totalHealTotal!,
          timeCCingOthersTotal!,
          neutralMinionsKilledTotal!,
          quadraKillsTotal!,
          timePlayedTotal!,
          gameEndedInSurrenderTotal!,
          goldEarnedTotal!,
          firstTowerTotal!,
          damageSelfMitigatedTotal!,
          doubleKillsTotal!,
          detectorWardsPlacedTotal!,
          wardsPlacedTotal!,
          wardsKilledTotal!,
          alliedJungleMonsterKillsTotal!,
          buffStolenTotal!,
          teamDamagePercentageTotal!,
          gamesPlayedTotal!,
          assistsTotal!,
          lossesTotal,
          winsTotal,
          csTotal);

      var lanes = getMapString(laneNames);

      String lanePref;
      if (lanes.isEmpty) {
        lanePref = "UTILITY";
      } else {
        lanePref = lanes[0];
      }

      //Most Played Map
      var champs = getMapString(champNames);

      resetVariables();
      for (var player in matchByChampList) {
        if (player.champName == champs[0]) {
          //champTotals(player.playerInfo);
          matchTotals(player.playerInfo);
        }
      }

      MatchHistoryTotals matchHistoryTotalsChamp1 = MatchHistoryTotals(
          baronKillsTotal!,
          killsTotal!,
          pinkWardsTotal!,
          endGameLevelTotal!,
          dmgToStructuresTotal!,
          deathsTotal!,
          dragonKillsTotal!,
          firstBloodTotal!,
          killingSpreeTotal!,
          objectiveStealTotal!,
          pentaKillsTotal!,
          damageTotal!,
          damageTakenTotal!,
          turretKillsTotal!,
          visionScoreTotal!,
          wardsGuardedTotal!,
          turretPlatesTakenTotal!,
          soloKillsTotal!,
          soloBaronKillsTotal!,
          scuttleCrabKillsTotal!,
          saveAllyFromDeathTotal!,
          quickSoloKillsTotal!,
          epicMonsterKillsNearEnemyJunglerTotal!,
          enemyJungleMonsterKillsTotal!,
          earlyLaningPhaseGoldExpAdvantageTotal!,
          effectiveHealAndShieldingTotal!,
          earliestBaronRecord!,
          epicMonsterKillsWithin30SecondsOfSpawnTotal!,
          fasterSupportQuestCompletionTotal!,
          firstTurretKilledTimeRecord!,
          gameLengthTotal!,
          goldPerMinuteTotal!,
          hadOpenNexusWinsTotal!,
          immobilizeAndKillWithAllyTotal!,
          jungleCsBefore10MinutesTotal!,
          junglerKillsEarlyJungleTotal!,
          kdaTotal!,
          killAfterHiddenWithAllyTotal!,
          killParticipationTotal!,
          killsNearEnemyTurretTotal!,
          killsOnLanersEarlyJungleAsJunglerTotal!,
          killsOnOtherLanesEarlyJungleAsLanerTotal!,
          killsUnderOwnTurretTotal!,
          landSkillShotsEarlyGameTotal!,
          laneMinionsFirst10MinutesTotal!,
          maxCsAdvantageOnLaneOpponentTotal!,
          legendaryCountTotal!,
          lostAnInhibitorWinsTotal!,
          multiTurretRiftHeraldCountTotal!,
          perfectDragonSoulsTakenTotal!,
          multikillsAfterAggressiveFlashTotal!,
          multikillsTotal!,
          outnumberedKillsTotal!,
          perfectGameTotal!,
          quickCleanseTotal!,
          dodgeSkillShotsSmallWindowTotal!,
          damageTakenOnTeamPercentageTotal!,
          damagePerMinuteTotal!,
          acesBefore15MinutesTotal!,
          tripleKillsTotal!,
          inhibitorTakedownsTotal!,
          totalHealTotal!,
          timeCCingOthersTotal!,
          neutralMinionsKilledTotal!,
          quadraKillsTotal!,
          timePlayedTotal!,
          gameEndedInSurrenderTotal!,
          goldEarnedTotal!,
          firstTowerTotal!,
          damageSelfMitigatedTotal!,
          doubleKillsTotal!,
          detectorWardsPlacedTotal!,
          wardsPlacedTotal!,
          wardsKilledTotal!,
          alliedJungleMonsterKillsTotal!,
          buffStolenTotal!,
          teamDamagePercentageTotal!,
          gamesPlayedTotal!,
          assistsTotal!,
          lossesTotal,
          winsTotal,
          csTotal);

      resetVariables();
      for (var player in matchByChampList) {
        if (player.champName == champs[1]) {
          //champTotals(player.playerInfo);
          matchTotals(player.playerInfo);
        }
      }

      MatchHistoryTotals matchHistoryTotalsChamp2 = MatchHistoryTotals(
          baronKillsTotal!,
          killsTotal!,
          pinkWardsTotal!,
          endGameLevelTotal!,
          dmgToStructuresTotal!,
          deathsTotal!,
          dragonKillsTotal!,
          firstBloodTotal!,
          killingSpreeTotal!,
          objectiveStealTotal!,
          pentaKillsTotal!,
          damageTotal!,
          damageTakenTotal!,
          turretKillsTotal!,
          visionScoreTotal!,
          wardsGuardedTotal!,
          turretPlatesTakenTotal!,
          soloKillsTotal!,
          soloBaronKillsTotal!,
          scuttleCrabKillsTotal!,
          saveAllyFromDeathTotal!,
          quickSoloKillsTotal!,
          epicMonsterKillsNearEnemyJunglerTotal!,
          enemyJungleMonsterKillsTotal!,
          earlyLaningPhaseGoldExpAdvantageTotal!,
          effectiveHealAndShieldingTotal!,
          earliestBaronRecord!,
          epicMonsterKillsWithin30SecondsOfSpawnTotal!,
          fasterSupportQuestCompletionTotal!,
          firstTurretKilledTimeRecord!,
          gameLengthTotal!,
          goldPerMinuteTotal!,
          hadOpenNexusWinsTotal!,
          immobilizeAndKillWithAllyTotal!,
          jungleCsBefore10MinutesTotal!,
          junglerKillsEarlyJungleTotal!,
          kdaTotal!,
          killAfterHiddenWithAllyTotal!,
          killParticipationTotal!,
          killsNearEnemyTurretTotal!,
          killsOnLanersEarlyJungleAsJunglerTotal!,
          killsOnOtherLanesEarlyJungleAsLanerTotal!,
          killsUnderOwnTurretTotal!,
          landSkillShotsEarlyGameTotal!,
          laneMinionsFirst10MinutesTotal!,
          maxCsAdvantageOnLaneOpponentTotal!,
          legendaryCountTotal!,
          lostAnInhibitorWinsTotal!,
          multiTurretRiftHeraldCountTotal!,
          perfectDragonSoulsTakenTotal!,
          multikillsAfterAggressiveFlashTotal!,
          multikillsTotal!,
          outnumberedKillsTotal!,
          perfectGameTotal!,
          quickCleanseTotal!,
          dodgeSkillShotsSmallWindowTotal!,
          damageTakenOnTeamPercentageTotal!,
          damagePerMinuteTotal!,
          acesBefore15MinutesTotal!,
          tripleKillsTotal!,
          inhibitorTakedownsTotal!,
          totalHealTotal!,
          timeCCingOthersTotal!,
          neutralMinionsKilledTotal!,
          quadraKillsTotal!,
          timePlayedTotal!,
          gameEndedInSurrenderTotal!,
          goldEarnedTotal!,
          firstTowerTotal!,
          damageSelfMitigatedTotal!,
          doubleKillsTotal!,
          detectorWardsPlacedTotal!,
          wardsPlacedTotal!,
          wardsKilledTotal!,
          alliedJungleMonsterKillsTotal!,
          buffStolenTotal!,
          teamDamagePercentageTotal!,
          gamesPlayedTotal!,
          assistsTotal!,
          lossesTotal,
          winsTotal,
          csTotal);

      resetVariables();
      for (var player in matchByChampList) {
        if (player.champName == champs[2]) {
          //champTotals(player.playerInfo);
          matchTotals(player.playerInfo);
        }
      }

      MatchHistoryTotals matchHistoryTotalsChamp3 = MatchHistoryTotals(
          baronKillsTotal!,
          killsTotal!,
          pinkWardsTotal!,
          endGameLevelTotal!,
          dmgToStructuresTotal!,
          deathsTotal!,
          dragonKillsTotal!,
          firstBloodTotal!,
          killingSpreeTotal!,
          objectiveStealTotal!,
          pentaKillsTotal!,
          damageTotal!,
          damageTakenTotal!,
          turretKillsTotal!,
          visionScoreTotal!,
          wardsGuardedTotal!,
          turretPlatesTakenTotal!,
          soloKillsTotal!,
          soloBaronKillsTotal!,
          scuttleCrabKillsTotal!,
          saveAllyFromDeathTotal!,
          quickSoloKillsTotal!,
          epicMonsterKillsNearEnemyJunglerTotal!,
          enemyJungleMonsterKillsTotal!,
          earlyLaningPhaseGoldExpAdvantageTotal!,
          effectiveHealAndShieldingTotal!,
          earliestBaronRecord!,
          epicMonsterKillsWithin30SecondsOfSpawnTotal!,
          fasterSupportQuestCompletionTotal!,
          firstTurretKilledTimeRecord!,
          gameLengthTotal!,
          goldPerMinuteTotal!,
          hadOpenNexusWinsTotal!,
          immobilizeAndKillWithAllyTotal!,
          jungleCsBefore10MinutesTotal!,
          junglerKillsEarlyJungleTotal!,
          kdaTotal!,
          killAfterHiddenWithAllyTotal!,
          killParticipationTotal!,
          killsNearEnemyTurretTotal!,
          killsOnLanersEarlyJungleAsJunglerTotal!,
          killsOnOtherLanesEarlyJungleAsLanerTotal!,
          killsUnderOwnTurretTotal!,
          landSkillShotsEarlyGameTotal!,
          laneMinionsFirst10MinutesTotal!,
          maxCsAdvantageOnLaneOpponentTotal!,
          legendaryCountTotal!,
          lostAnInhibitorWinsTotal!,
          multiTurretRiftHeraldCountTotal!,
          perfectDragonSoulsTakenTotal!,
          multikillsAfterAggressiveFlashTotal!,
          multikillsTotal!,
          outnumberedKillsTotal!,
          perfectGameTotal!,
          quickCleanseTotal!,
          dodgeSkillShotsSmallWindowTotal!,
          damageTakenOnTeamPercentageTotal!,
          damagePerMinuteTotal!,
          acesBefore15MinutesTotal!,
          tripleKillsTotal!,
          inhibitorTakedownsTotal!,
          totalHealTotal!,
          timeCCingOthersTotal!,
          neutralMinionsKilledTotal!,
          quadraKillsTotal!,
          timePlayedTotal!,
          gameEndedInSurrenderTotal!,
          goldEarnedTotal!,
          firstTowerTotal!,
          damageSelfMitigatedTotal!,
          doubleKillsTotal!,
          detectorWardsPlacedTotal!,
          wardsPlacedTotal!,
          wardsKilledTotal!,
          alliedJungleMonsterKillsTotal!,
          buffStolenTotal!,
          teamDamagePercentageTotal!,
          gamesPlayedTotal!,
          assistsTotal!,
          lossesTotal,
          winsTotal,
          csTotal);
      resetVariables();
      for (var player in matchByChampList) {
        if (player.champName == champs[3]) {
          //champTotals(player.playerInfo);
          matchTotals(player.playerInfo);
        }
      }

      MatchHistoryTotals matchHistoryTotalsChamp4 = MatchHistoryTotals(
          baronKillsTotal!,
          killsTotal!,
          pinkWardsTotal!,
          endGameLevelTotal!,
          dmgToStructuresTotal!,
          deathsTotal!,
          dragonKillsTotal!,
          firstBloodTotal!,
          killingSpreeTotal!,
          objectiveStealTotal!,
          pentaKillsTotal!,
          damageTotal!,
          damageTakenTotal!,
          turretKillsTotal!,
          visionScoreTotal!,
          wardsGuardedTotal!,
          turretPlatesTakenTotal!,
          soloKillsTotal!,
          soloBaronKillsTotal!,
          scuttleCrabKillsTotal!,
          saveAllyFromDeathTotal!,
          quickSoloKillsTotal!,
          epicMonsterKillsNearEnemyJunglerTotal!,
          enemyJungleMonsterKillsTotal!,
          earlyLaningPhaseGoldExpAdvantageTotal!,
          effectiveHealAndShieldingTotal!,
          earliestBaronRecord!,
          epicMonsterKillsWithin30SecondsOfSpawnTotal!,
          fasterSupportQuestCompletionTotal!,
          firstTurretKilledTimeRecord!,
          gameLengthTotal!,
          goldPerMinuteTotal!,
          hadOpenNexusWinsTotal!,
          immobilizeAndKillWithAllyTotal!,
          jungleCsBefore10MinutesTotal!,
          junglerKillsEarlyJungleTotal!,
          kdaTotal!,
          killAfterHiddenWithAllyTotal!,
          killParticipationTotal!,
          killsNearEnemyTurretTotal!,
          killsOnLanersEarlyJungleAsJunglerTotal!,
          killsOnOtherLanesEarlyJungleAsLanerTotal!,
          killsUnderOwnTurretTotal!,
          landSkillShotsEarlyGameTotal!,
          laneMinionsFirst10MinutesTotal!,
          maxCsAdvantageOnLaneOpponentTotal!,
          legendaryCountTotal!,
          lostAnInhibitorWinsTotal!,
          multiTurretRiftHeraldCountTotal!,
          perfectDragonSoulsTakenTotal!,
          multikillsAfterAggressiveFlashTotal!,
          multikillsTotal!,
          outnumberedKillsTotal!,
          perfectGameTotal!,
          quickCleanseTotal!,
          dodgeSkillShotsSmallWindowTotal!,
          damageTakenOnTeamPercentageTotal!,
          damagePerMinuteTotal!,
          acesBefore15MinutesTotal!,
          tripleKillsTotal!,
          inhibitorTakedownsTotal!,
          totalHealTotal!,
          timeCCingOthersTotal!,
          neutralMinionsKilledTotal!,
          quadraKillsTotal!,
          timePlayedTotal!,
          gameEndedInSurrenderTotal!,
          goldEarnedTotal!,
          firstTowerTotal!,
          damageSelfMitigatedTotal!,
          doubleKillsTotal!,
          detectorWardsPlacedTotal!,
          wardsPlacedTotal!,
          wardsKilledTotal!,
          alliedJungleMonsterKillsTotal!,
          buffStolenTotal!,
          teamDamagePercentageTotal!,
          gamesPlayedTotal!,
          assistsTotal!,
          lossesTotal,
          winsTotal,
          csTotal);
      setState(() {
        isLoading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TestPage(
                accID: accID,
                level: level,
                profileIconID: profileIconID,
                puuid: puuid,
                summonerID: summmonerID,
                summonerName: summonerName,
                server: server,
                soloQRank: ranksoloQ,
                flexRank: rankFlex,
                masteryList: masteryList,
                matchHistoryList: matchHistory,
                matchHistoryTotals: matchHistoryTotals,
                matchHistoryTotalschamp1: matchHistoryTotalsChamp1,
                champsPlayedIds: champs,
                matchHistoryTotalschamp2: matchHistoryTotalsChamp2,
                matchHistoryTotalschamp3: matchHistoryTotalsChamp3,
                matchHistoryTotalschamp4: matchHistoryTotalsChamp4,
                lane: lanePref)),
      );
    } else {
      //alert no summoner with this name
      //print("Error");
    }
  }
}
