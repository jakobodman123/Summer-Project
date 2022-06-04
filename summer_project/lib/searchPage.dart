import 'dart:io';

import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/game.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:dart_lol/dart_lol.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:summer_project/main.dart';
import 'package:http/http.dart' as http;
import 'package:summer_project/matchHistoryTotals.dart';
import 'dart:convert';

import 'package:summer_project/matchStats.dart';
import 'package:summer_project/slides.dart';

String apiToken = "Nerfa Zilean LoL";

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

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<Rank> getRankInfos2({String? summonerID}) async {
    var url =
        'https://$server.api.riotgames.com/lol/league/v4/entries/by-summoner/$summonerID?api_key=$apiToken';
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.body.toString() != '[]') {
      return Rank.fromJson(
        json.decode(
          response.body,
        )[1],
      );
    } else {
      return Rank(
          hotStreak: false,
          leagueId: '0',
          leaguePoints: 0,
          losses: 0,
          wins: 0,
          rank: 'unranked',
          tier: 'no tier');
    }
  }

  int findPersonUsingLoop(List<Participants>? people, String? summonerName) {
    for (var i = 0; i < people!.length; i++) {
      if (people[i].summonerName == summonerName) {
        // Found the person, stop the loop
        return i;
      }
    }
    return 0;
  }

  void matchTotals(Participants player) {
    int? baronKills = player.challenges!.baronTakedowns;
    baronKillsTotal = (baronKillsTotal! + baronKills!);
    int? kills = player.kills;
    killsTotal = (killsTotal! + kills!);
    int? pinkWards = player.visionWardsBoughtInGame;
    pinkWardsTotal = (pinkWardsTotal! + pinkWards!);
    int? endGameLevel = player.champLevel;
    endGameLevelTotal = (endGameLevelTotal! + endGameLevel!);
    int? dmgToStructures = player.damageDealtToBuildings;
    dmgToStructuresTotal = (dmgToStructuresTotal! + dmgToStructures!);
    int? deaths = player.deaths;
    deathsTotal = (deathsTotal! + deaths!);
    int? dragonKills = player.dragonKills;
    dragonKillsTotal = (dragonKillsTotal! + dragonKills!);
    if (player.firstBloodKill!) {
      int? firstBlood = 1;
      firstBloodTotal = (firstBloodTotal! + firstBlood);
    } else {
      int? firstBlood = 0;
      firstBloodTotal = (firstBloodTotal! + firstBlood);
    }
    if (player.firstBloodAssist!) {
      int? firstBlood = 1;
      firstBloodTotal = (firstBloodTotal! + firstBlood);
    } else {
      int? firstBlood = 0;
      firstBloodTotal = (firstBloodTotal! + firstBlood);
    }
    int? killingSprees = player.killingSprees;
    killingSpreeTotal = (killingSpreeTotal! + killingSprees!);
    int? objectiveSteal = player.objectivesStolen;
    objectiveStealTotal = (objectiveStealTotal! + objectiveSteal!);
    int? pentaKills = player.pentaKills;
    pentaKillsTotal = (pentaKillsTotal! + pentaKills!);
    int? damage = player.totalDamageDealtToChampions;
    damageTotal = (damageTotal! + damage!);
    int? damageTaken = player.totalDamageTaken;
    damageTakenTotal = (damageTakenTotal! + damageTaken!);
    int? turretKills = player.turretKills;
    turretKillsTotal = (turretKillsTotal! + turretKills!);
    int? visionScore = player.visionScore;
    visionScoreTotal = (visionScoreTotal! + visionScore!);
    int? buffStolen = player.challenges!.buffsStolen;
    buffStolenTotal = (buffStolenTotal! + buffStolen!);
    double? alliedJungleMonsterKills =
        player.challenges!.alliedJungleMonsterKills;
    alliedJungleMonsterKillsTotal =
        (alliedJungleMonsterKillsTotal! + alliedJungleMonsterKills!);
    int? wardsKilled = player.wardsKilled;
    wardsKilledTotal = (wardsKilledTotal! + wardsKilled!);
    int? wardsPlaced = player.wardsPlaced;
    wardsPlacedTotal = (wardsPlacedTotal! + wardsPlaced!);
    int? detectorWardsPlaced = player.detectorWardsPlaced;
    detectorWardsPlacedTotal =
        (detectorWardsPlacedTotal! + detectorWardsPlaced!);
    int? assists = player.assists;
    assistsTotal = (assistsTotal! + assists!);
    int? doubleKills = player.doubleKills;
    doubleKillsTotal = (doubleKillsTotal! + doubleKills!);
    int? damageSelfMitigated = player.damageSelfMitigated;
    damageSelfMitigatedTotal =
        (damageSelfMitigatedTotal! + damageSelfMitigated!);
    if (player.firstTowerAssist!) {
      int? firstTower = 1;
      firstTowerTotal = (firstTowerTotal! + firstTower);
    } else {
      int? firstTower = 0;
      firstTowerTotal = (firstTowerTotal! + firstTower);
    }
    if (player.firstTowerKill!) {
      int? firstTower = 1;
      firstTowerTotal = (firstTowerTotal! + firstTower);
    } else {
      int? firstTower = 0;
      firstTowerTotal = (firstTowerTotal! + firstTower);
    }
    if (player.gameEndedInSurrender!) {
      int? gameEndedInSurrender = 1;
      gameEndedInSurrenderTotal =
          (gameEndedInSurrenderTotal! + gameEndedInSurrender);
    } else {
      int? gameEndedInSurrender = 0;
      gameEndedInSurrenderTotal =
          (gameEndedInSurrenderTotal! + gameEndedInSurrender);
    }
    //player.individualPosition;
    int? goldEarned = player.goldEarned;
    goldEarnedTotal = (goldEarnedTotal! + goldEarned!);
    int? timePlayed = player.timePlayed;
    timePlayedTotal = (timePlayedTotal! + timePlayed!);
    int? quadraKills = player.quadraKills;
    quadraKillsTotal = (quadraKillsTotal! + quadraKills!);
    int? neutralMinionsKilled = player.neutralMinionsKilled;
    neutralMinionsKilledTotal =
        (neutralMinionsKilledTotal! + neutralMinionsKilled!);
    int? timeCCingOthers = player.timeCCingOthers;
    timeCCingOthersTotal = (timeCCingOthersTotal! + timeCCingOthers!);
    int? totalHeal = player.totalHeal;
    totalHealTotal = (totalHealTotal! + totalHeal!);
    int? inhibitorTakedowns = player.inhibitorTakedowns;
    inhibitorTakedownsTotal = (inhibitorTakedownsTotal! + inhibitorTakedowns!);
    int? tripleKills = player.tripleKills;
    tripleKillsTotal = (tripleKillsTotal! + tripleKills!);
    int? acesBefore15Minutes = player.challenges!.acesBefore15Minutes;
    acesBefore15MinutesTotal =
        (acesBefore15MinutesTotal! + acesBefore15Minutes!);
    double? damagePerMinute = player.challenges!.damagePerMinute;
    damagePerMinuteTotal = (damagePerMinuteTotal! + damagePerMinute!);
    double? damageTakenOnTeamPercentage =
        player.challenges!.damageTakenOnTeamPercentage;
    damageTakenOnTeamPercentageTotal =
        (damageTakenOnTeamPercentageTotal! + damageTakenOnTeamPercentage!);
    int? dodgeSkillShotsSmallWindow =
        player.challenges!.dodgeSkillShotsSmallWindow;
    dodgeSkillShotsSmallWindowTotal =
        (dodgeSkillShotsSmallWindowTotal! + dodgeSkillShotsSmallWindow!);
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
        player.challenges!.effectiveHealAndShielding;
    effectiveHealAndShieldingTotal =
        (effectiveHealAndShieldingTotal! + effectiveHealAndShielding!);
/*
    int? earlyLaningPhaseGoldExpAdvantage =
        player.challenges!.earlyLaningPhaseGoldExpAdvantage;
    earlyLaningPhaseGoldExpAdvantageTotal =
        (earlyLaningPhaseGoldExpAdvantageTotal! +
            earlyLaningPhaseGoldExpAdvantage!);
            */
    double? enemyJungleMonsterKills =
        player.challenges!.enemyJungleMonsterKills;
    enemyJungleMonsterKillsTotal =
        (enemyJungleMonsterKillsTotal! + enemyJungleMonsterKills!);
    int? epicMonsterKillsNearEnemyJungler =
        player.challenges!.epicMonsterKillsNearEnemyJungler;
    epicMonsterKillsNearEnemyJunglerTotal =
        (epicMonsterKillsNearEnemyJunglerTotal! +
            epicMonsterKillsNearEnemyJungler!);
    int? epicMonsterKillsWithin30SecondsOfSpawn =
        player.challenges!.epicMonsterKillsWithin30SecondsOfSpawn;
    epicMonsterKillsWithin30SecondsOfSpawnTotal =
        (epicMonsterKillsWithin30SecondsOfSpawnTotal! +
            epicMonsterKillsWithin30SecondsOfSpawn!);
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
    double? gameLength = player.challenges!.gameLength;
    gameLengthTotal = (gameLengthTotal! + gameLength!);
    double? goldPerMinute = player.challenges!.goldPerMinute;
    goldPerMinuteTotal = (goldPerMinuteTotal! + goldPerMinute!);
    if ((player.challenges!.hadOpenNexus! >= 1) && player.win!) {
      int? hadOpenNexusWins = 1;
      hadOpenNexusWinsTotal = (hadOpenNexusWinsTotal! + hadOpenNexusWins);
    }
    //player.challenges!.highestChampionDamage;
    int? immobilizeAndKillWithAlly =
        player.challenges!.immobilizeAndKillWithAlly;
    immobilizeAndKillWithAllyTotal =
        (immobilizeAndKillWithAllyTotal! + immobilizeAndKillWithAlly!);
    double? jungleCsBefore10Minutes =
        player.challenges!.jungleCsBefore10Minutes;
    jungleCsBefore10MinutesTotal =
        (jungleCsBefore10MinutesTotal! + jungleCsBefore10Minutes!);
    /*
    int? junglerKillsEarlyJungle = player.challenges!.junglerKillsEarlyJungle;
    junglerKillsEarlyJungleTotal =
        (junglerKillsEarlyJungleTotal! + junglerKillsEarlyJungle!);
        */
    double? kda = player.challenges!.kda;
    kdaTotal = (kdaTotal! + kda!);
    int? killAfterHiddenWithAlly = player.challenges!.killAfterHiddenWithAlly;
    killAfterHiddenWithAllyTotal =
        (killAfterHiddenWithAllyTotal! + killAfterHiddenWithAlly!);
    double? killParticipation = player.challenges!.killParticipation;
    killParticipationTotal = (killParticipationTotal! + killParticipation!);
    int? killsNearEnemyTurret = player.challenges!.killsNearEnemyTurret;
    killsNearEnemyTurretTotal =
        (killsNearEnemyTurretTotal! + killsNearEnemyTurret!);
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
    int? killsUnderOwnTurret = player.challenges!.killsUnderOwnTurret;
    killsUnderOwnTurretTotal =
        (killsUnderOwnTurretTotal! + killsUnderOwnTurret!);
    int? landSkillShotsEarlyGame = player.challenges!.landSkillShotsEarlyGame;
    landSkillShotsEarlyGameTotal =
        (landSkillShotsEarlyGameTotal! + landSkillShotsEarlyGame!);
    int? laneMinionsFirst10Minutes =
        player.challenges!.laneMinionsFirst10Minutes;
    laneMinionsFirst10MinutesTotal =
        (laneMinionsFirst10MinutesTotal! + laneMinionsFirst10Minutes!);
    /*  
    double? maxCsAdvantageOnLaneOpponent =
        player.challenges!.maxCsAdvantageOnLaneOpponent;
    maxCsAdvantageOnLaneOpponentTotal =
        (maxCsAdvantageOnLaneOpponentTotal! + maxCsAdvantageOnLaneOpponent!);
        */

    //player.challenges!.maxKillDeficit;
    //player.win;
    int? legendaryCount = player.challenges!.legendaryCount;
    legendaryCountTotal = (legendaryCountTotal! + legendaryCount!);
    if ((player.challenges!.lostAnInhibitor! >= 1) && player.win!) {
      int? lostAnInhibitorWins = 1;
      lostAnInhibitorWinsTotal =
          (lostAnInhibitorWinsTotal! + lostAnInhibitorWins);
    }
    int? multiTurretRiftHeraldCount =
        player.challenges!.multiTurretRiftHeraldCount;
    multiTurretRiftHeraldCountTotal =
        (multiTurretRiftHeraldCountTotal! + multiTurretRiftHeraldCount!);
    int? perfectDragonSoulsTaken = player.challenges!.perfectDragonSoulsTaken;
    perfectDragonSoulsTakenTotal =
        (perfectDragonSoulsTakenTotal! + perfectDragonSoulsTaken!);
    int? multikillsAfterAggressiveFlash =
        player.challenges!.multikillsAfterAggressiveFlash;
    multikillsAfterAggressiveFlashTotal =
        (multikillsAfterAggressiveFlashTotal! +
            multikillsAfterAggressiveFlash!);
    int? multikills = player.challenges!.multikills;
    multikillsTotal = (multikillsTotal! + multikills!);
    int? outnumberedKills = player.challenges!.outnumberedKills;
    outnumberedKillsTotal = (outnumberedKillsTotal! + outnumberedKills!);
    int? perfectGame = player.challenges!.perfectGame;
    perfectGameTotal = (perfectGameTotal! + perfectGame!);
    int? quickCleanse = player.challenges!.quickCleanse;
    quickCleanseTotal = (quickCleanseTotal! + quickCleanse!);
    int? quickSoloKills = player.challenges!.quickSoloKills;
    quickSoloKillsTotal = (quickSoloKillsTotal! + quickSoloKills!);
    int? saveAllyFromDeath = player.challenges!.saveAllyFromDeath;
    saveAllyFromDeathTotal = (saveAllyFromDeathTotal! + saveAllyFromDeath!);
    int? scuttleCrabKills = player.challenges!.scuttleCrabKills;
    scuttleCrabKillsTotal = (scuttleCrabKillsTotal! + scuttleCrabKills!);
    int? soloBaronKills = player.challenges!.soloBaronKills;
    soloBaronKillsTotal = (soloBaronKillsTotal! + soloBaronKills!);
    int? soloKills = player.challenges!.soloKills;
    soloKillsTotal = (soloKillsTotal! + soloKills!);
    int? turretPlatesTaken = player.challenges!.turretPlatesTaken;
    turretPlatesTakenTotal = (turretPlatesTakenTotal! + turretPlatesTaken!);
    double? teamDamagePercentage = player.challenges!.teamDamagePercentage;
    teamDamagePercentageTotal =
        (teamDamagePercentageTotal! + teamDamagePercentage!);
    int? wardsGuarded = player.challenges!.wardsGuarded;
    wardsGuardedTotal = (wardsGuardedTotal! + wardsGuarded!);
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
      //print("\nID: $id");
      //print(match);
      //print("---");
      final matchStats = MatchStats.fromJson(json.decode(json.encode(match)));
      Participants player = matchStats.info!.participants![
          findPersonUsingLoop(matchStats.info!.participants, summonerName)];

      matchTotals(player);

      matchHistoryList.add(
        MatchStats.fromJson(json.decode(json.encode(match))),
      );
    }

    return matchHistoryList;
  }

  void onDonePress() {
// Do what you want
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          //column med padding på textfield size.height * 0.5
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
                  child: TextFormField(
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
                          setState(() {
                            isLoading = true;
                          });
                          final league =
                              League(apiToken: apiToken, server: server);
                          var summoner = await league.getSummonerInfo(
                              summonerName: summonerTextController.text);
                          print(summoner.puuid);
                          if (1 == 1) {
                            String? accID = summoner.accID;
                            int? level = summoner.level;
                            int? profileIconID = summoner.profileIconID;
                            String? puuid = summoner.puuid;
                            String? summmonerID = summoner.summonerID;
                            String? summonerName = summoner.summonerName;
                            Rank ranksoloQ = await league.getRankInfos(
                                summonerID: summmonerID);
                            Rank rankFlex =
                                await getRankInfos2(summonerID: summmonerID);

                            List<ChampionMastery>? masteryList = await league
                                .getChampionMasteries(summonerID: summmonerID);

                            List<MatchStats>? matchHistory =
                                await getGameHistory(
                              summonerName: summonerName,
                              puuid: summoner.puuid,
                            );

                            MatchHistoryTotals matchHistoryTotals =
                                MatchHistoryTotals(
                              baronKillsTotal,
                              killsTotal,
                              pinkWardsTotal,
                              endGameLevelTotal,
                              dmgToStructuresTotal,
                              deathsTotal,
                              dragonKillsTotal,
                              firstBloodTotal,
                              killingSpreeTotal,
                              objectiveStealTotal,
                              pentaKillsTotal,
                              damageTotal,
                              damageTakenTotal,
                              turretKillsTotal,
                              visionScoreTotal,
                              wardsGuardedTotal,
                              turretPlatesTakenTotal,
                              soloKillsTotal,
                              soloBaronKillsTotal,
                              scuttleCrabKillsTotal,
                              saveAllyFromDeathTotal,
                              quickSoloKillsTotal,
                              epicMonsterKillsNearEnemyJunglerTotal,
                              enemyJungleMonsterKillsTotal,
                              earlyLaningPhaseGoldExpAdvantageTotal,
                              effectiveHealAndShieldingTotal,
                              earliestBaronRecord,
                              epicMonsterKillsWithin30SecondsOfSpawnTotal,
                              fasterSupportQuestCompletionTotal,
                              firstTurretKilledTimeRecord,
                              gameLengthTotal,
                              goldPerMinuteTotal,
                              hadOpenNexusWinsTotal,
                              immobilizeAndKillWithAllyTotal,
                              jungleCsBefore10MinutesTotal,
                              junglerKillsEarlyJungleTotal,
                              kdaTotal,
                              killAfterHiddenWithAllyTotal,
                              killParticipationTotal,
                              killsNearEnemyTurretTotal,
                              killsOnLanersEarlyJungleAsJunglerTotal,
                              killsOnOtherLanesEarlyJungleAsLanerTotal,
                              killsUnderOwnTurretTotal,
                              landSkillShotsEarlyGameTotal,
                              laneMinionsFirst10MinutesTotal,
                              maxCsAdvantageOnLaneOpponentTotal,
                              legendaryCountTotal,
                              lostAnInhibitorWinsTotal,
                              multiTurretRiftHeraldCountTotal,
                              perfectDragonSoulsTakenTotal,
                              multikillsAfterAggressiveFlashTotal,
                              multikillsTotal,
                              outnumberedKillsTotal,
                              perfectGameTotal,
                              quickCleanseTotal,
                              dodgeSkillShotsSmallWindowTotal,
                              damageTakenOnTeamPercentageTotal,
                              damagePerMinuteTotal,
                              acesBefore15MinutesTotal,
                              tripleKillsTotal,
                              inhibitorTakedownsTotal,
                              totalHealTotal,
                              timeCCingOthersTotal,
                              neutralMinionsKilledTotal,
                              quadraKillsTotal,
                              timePlayedTotal,
                              gameEndedInSurrenderTotal,
                              goldEarnedTotal,
                              firstTowerTotal,
                              damageSelfMitigatedTotal,
                              doubleKillsTotal,
                              detectorWardsPlacedTotal,
                              wardsPlacedTotal,
                              wardsKilledTotal,
                              alliedJungleMonsterKillsTotal,
                              buffStolenTotal,
                              teamDamagePercentageTotal,
                            );

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
                                      )),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  //Variabler
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
}
