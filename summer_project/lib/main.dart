import 'dart:collection';
import 'dart:ui';
import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:dart_lol/LeagueStuff/summoner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:summer_project/top-champ-widgets/altChamps/altChampsWidget.dart';
import 'package:summer_project/api/apiMethods.dart';
import 'package:summer_project/top-champ-widgets/bestChamp/bestChampionCard.dart';
import 'package:summer_project/generated-classes/challenges.dart';
import 'package:summer_project/generated-classes/item.dart';
import 'package:summer_project/mainProfile.dart';
import 'package:summer_project/generated-classes/matchByChamp.dart';
import 'package:summer_project/match-history/matchHistory.dart';
import 'package:summer_project/matchHistoryTotals.dart';
import 'package:summer_project/generated-classes/matchStats.dart';
import 'package:summer_project/searchPage.dart';
import 'package:summer_project/slides.dart';
import 'package:summer_project/api/itemApi.dart';

Color colorLightGrey = const Color(0xFF292C33).withOpacity(0.4);
Color colorDarkGrey = const Color(0xFF191919);

Color primaryColor = const Color(0xFF292C33).withOpacity(0.4);

Color colorGrey = const Color(0xFF6B6A69).withOpacity(0.4);

//void main() => runApp(const SummerProject());

void main() {
  runApp(const SummerProject());
}

class SummerProject extends StatelessWidget {
  const SummerProject();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SearchPage(),
      },
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage(
      {Key? key,
      this.summonerName,
      this.level,
      this.accID,
      this.summonerID,
      this.lastTimeOnline,
      this.profileIconID,
      this.puuid,
      this.server,
      this.soloQRank,
      this.flexRank,
      this.matchHistoryList,
      this.matchHistoryTotals,
      this.matchHistoryTotalschamp1,
      this.champsPlayedIds,
      this.matchHistoryTotalschamp2,
      this.matchHistoryTotalschamp3,
      this.matchHistoryTotalschamp4,
      this.lane,
      this.champMasteryList,
      this.challenges,
      this.playerIndexs})
      : super(key: key);

  //TestPage();
  final String? summonerName;
  final int? level;
  final String? accID;
  final String? summonerID;
  final DateTime? lastTimeOnline;
  final int? profileIconID;
  final String? puuid;
  final String? server;
  final Rank? soloQRank;
  final Rank? flexRank;
  final List<MatchStats>? matchHistoryList;
  final MatchHistoryTotals? matchHistoryTotals;
  final MatchHistoryTotals? matchHistoryTotalschamp1;
  final MatchHistoryTotals? matchHistoryTotalschamp2;
  final MatchHistoryTotals? matchHistoryTotalschamp3;
  final MatchHistoryTotals? matchHistoryTotalschamp4;
  final List<dynamic>? champsPlayedIds;
  final String? lane;
  final List<ChampionMastery>? champMasteryList;
  final AccountChallenges? challenges;
  final List<int>? playerIndexs;

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String itemTypeString = "";
  List<Item> itemList = <Item>[];
  String iconID = "4884";
  bool showTextField = false;
  final summonerTextController = TextEditingController();
  String server = "EUW1";
  List<String>? champNames = [];
  List<MatchByChamp> matchByChampList = [];
  List<String>? laneNames = [];
  List<int>? playerIndexs = [];

  @override
  void initState() {
    super.initState();
    print("perkID");
    print(widget.matchHistoryList![0].info!.participants?[0].perks?.styles?[1]
        .selections?[1].perk
        .toString());

    print(widget.matchHistoryList![0].info!.participants?[0].perks?.styles?[0]
        .selections?[0].perk
        .toString());

    print(widget.matchHistoryList![0].info!.gameMode);
    print(widget.matchHistoryList![0].info!.queueId);
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

  Widget _buildFloatingSearchBtn() {
    return Expanded(
      child: InkWell(
        child: const GlowIcon(
          Icons.search,
          color: Colors.blue,
          glowColor: Colors.blue,
        ),
        onTap: () {
          setState(() {
            showTextField = !showTextField;
          });
        },
      ),
    );
  }

  Widget _buildTextField() {
    return Expanded(
      child: Center(
        child: TextField(
          //autofocus: true,
          controller: summonerTextController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: Colors.blue), //<-- SEE HERE
            ),
          ),
          onSubmitted: (value) async {
            await onTapLoad1();
          },
          onTap: () {
            showTextField = false;
          },
        ),
      ),
    );
  }

  Future<List<MatchStats>?> getGameHistory(
      {String? summonerName, int start = 0, int count = 10}) async {
    String europe = "europe";

    //test
    List<MatchStats>? matchHistoryList2 = [];
    await ItemApi.getGames(summonerName!).then((response) {
      //print(response.body);
      Iterable list = json.decode(response.body);

      matchHistoryList2 =
          list.map((model) => MatchStats.fromJson(model)).toList();
      //print(matchHistoryList2);
    });
    for (MatchStats match in matchHistoryList2!) {
      ApiMethods apiMethods = ApiMethods();

      final matchStats = MatchStats.fromJson(json.decode(json.encode(match)));

      int? playerIndex = await apiMethods.findPersonUsingLoop(
          matchStats.info?.participants, summonerName.toLowerCase());

      playerIndexs?.add(playerIndex);

      Participants? player = matchStats.info?.participants?[playerIndex];

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
    }
    return matchHistoryList2;
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? IntroSlider(
            slides: slides,
          )
        : Scaffold(
            //extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: colorDarkGrey,
              title: const Text('Play Easy Champion Selector'),
              actions: <Widget>[
                Container(
                  width: 400 * 0.7,
                  padding: const EdgeInsets.fromLTRB(
                      15.0 * 0.7, 0.0, 15.0 * 0.7, 0.0),
                  child: Row(
                    children: <Widget>[
                      //showTextField ? _buildTextField() : Container(),
                      //_buildFloatingSearchBtn(),
                      _buildTextField()
                    ],
                  ),
                ),
                IconButton(
                  icon: const GlowIcon(
                    Icons.navigate_next,
                    color: Colors.blue,
                    glowColor: Colors.blue,
                  ),
                  tooltip: 'Go to the next page',
                  onPressed: () async {
                    await onTapLoad1();
                  },
                ),
              ],
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: colorDarkGrey,
              child: SingleChildScrollView(
                child: Wrap(
                  runAlignment: WrapAlignment.spaceBetween,
                  spacing: 40 * 0.7,
                  runSpacing: 30,
                  clipBehavior: Clip.hardEdge,
                  children: [
                    SizedBox(
                      width: 500 * 0.7,
                      height: 1250 * 0.7,
                      child: MainProfile(
                          widget.profileIconID.toString(),
                          widget.level.toString(),
                          widget.summonerName,
                          widget.summonerID,
                          widget.soloQRank,
                          widget.flexRank,
                          widget.matchHistoryTotals,
                          widget.lane,
                          widget.champMasteryList,
                          widget.challenges),
                    ),

                    //Vit box
                    BestChampionCard(
                      summonerName: widget.summonerName,
                      //champName: widget.masteryList![0].championName?.replaceAll(RegExp(r"\s+\b|\b\s"), ""),
                      champName: widget.champsPlayedIds![0],
                      matchHistoryTotals: widget.matchHistoryTotalschamp1,
                      gamesPlayed: widget.matchHistoryTotalschamp1?.gamesPlayed,
                    ),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 20 * 0.7,
                        ),
                        child: Text(
                          "Match History",
                          style: TextStyle(
                            fontSize: 28 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      MatchHistoryWidget(
                        matchHistoryList: widget.matchHistoryList,
                        summonerName: widget.summonerName,
                        playerIndexes: widget.playerIndexs,
                      ),
                    ]),
                    SizedBox(
                      width: 650 * 0.7,
                      height: 1150 * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 0,
                            ),
                            child: Text(
                              "Alternative Champs",
                              style: TextStyle(
                                fontSize: 28 * 0.7,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          widget.champsPlayedIds!.length < 2
                              ? const SizedBox()
                              : AltChampsWidget(
                                  widget.champsPlayedIds![1],
                                  widget.matchHistoryTotalschamp2?.gamesPlayed,
                                  widget.matchHistoryTotalschamp2?.winsTotal,
                                  widget.matchHistoryTotalschamp2),
                          widget.champsPlayedIds!.length < 3
                              ? const SizedBox()
                              : AltChampsWidget(
                                  widget.champsPlayedIds![2],
                                  widget.matchHistoryTotalschamp3?.gamesPlayed,
                                  widget.matchHistoryTotalschamp3?.winsTotal,
                                  widget.matchHistoryTotalschamp3),
                          widget.champsPlayedIds!.length < 4
                              ? const SizedBox()
                              : AltChampsWidget(
                                  widget.champsPlayedIds![3],
                                  widget.matchHistoryTotalschamp4?.gamesPlayed,
                                  widget.matchHistoryTotalschamp4?.winsTotal,
                                  widget.matchHistoryTotalschamp4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

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

  Future<void> onTapLoad1() async {
    Summoner? summonerObject = Summoner();
    await ItemApi.getSummoner(summonerTextController.text).then((response) {
      Summoner object = Summoner.fromJson(
        json.decode(
          response.body,
        ),
      );
      summonerObject = object;
    });

    if (summonerObject?.puuid != null) {
      print(summonerObject?.puuid);
      setState(() {
        isLoading = true;
      });
      String? accID = summonerObject?.accID;
      int? level = summonerObject?.level;
      int? profileIconID = summonerObject?.profileIconID;
      String? puuid = summonerObject?.puuid;
      String? summmonerID = summonerObject?.summonerID;

      List<ChampionMastery>? champMasteryList = [];
      await ItemApi.getMasteries(summonerObject?.summonerID).then((response) {
        //print(response.body);
        Iterable list = json.decode(response.body);

        champMasteryList =
            list.map((model) => ChampionMastery.fromJson(model)).toList();
        //print(matchHistoryList2);
      });

      AccountChallenges challenges = AccountChallenges();
      await ItemApi.getChallenges(summonerObject?.puuid).then((response) {
        AccountChallenges object = AccountChallenges.fromJson(
          json.decode(
            response.body,
          ),
        );
        challenges = object;
      });

      List<Rank>? rankedList = [];
      await ItemApi.getRanked(summmonerID!).then((response) {
        Iterable list = json.decode(response.body);

        rankedList = list.map((model) => Rank.fromJson(model)).toList();
      });
      Rank? ranksoloQ;
      if (rankedList!.length < 1) {
        ranksoloQ = Rank(
            hotStreak: false,
            wins: 0,
            losses: 0,
            rank: "",
            leaguePoints: 0,
            leagueId: "Unranked",
            tier: "Unranked");
      } else {
        ranksoloQ = rankedList![0];
      }

      Rank? rankFlex;
      if (rankedList!.length < 2) {
        rankFlex = Rank(
            hotStreak: false,
            wins: 0,
            losses: 0,
            rank: "",
            leaguePoints: 0,
            leagueId: "Unranked",
            tier: "Unranked");
      } else {
        rankFlex = rankedList![1];
      }

      List<MatchStats>? matchHistory = await getGameHistory(
        summonerName: summonerTextController.text,
      );

      var lanes = getMapString(laneNames);

      String lanePref;
      if (lanes.isEmpty) {
        lanePref = "UTILITY";
      } else {
        lanePref = lanes[0];
      }

      //Most Played Map

      List<dynamic> champs = getMapString(champNames);

      MatchHistoryTotals matchHistoryTotals = setTotals(champs, -1);

      MatchHistoryTotals matchHistoryTotalsChamp1 = setTotals(champs, 0);
      MatchHistoryTotals matchHistoryTotalsChamp2 = setTotals(champs, 1);
      MatchHistoryTotals matchHistoryTotalsChamp3 = setTotals(champs, 2);
      MatchHistoryTotals matchHistoryTotalsChamp4 = setTotals(champs, 3);

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
                  summonerName: summonerObject?.summonerName,
                  server: server,
                  soloQRank: ranksoloQ,
                  flexRank: rankFlex,
                  matchHistoryList: matchHistory,
                  matchHistoryTotals: matchHistoryTotals,
                  matchHistoryTotalschamp1: matchHistoryTotalsChamp1,
                  champsPlayedIds: champs,
                  matchHistoryTotalschamp2: matchHistoryTotalsChamp2,
                  matchHistoryTotalschamp3: matchHistoryTotalsChamp3,
                  matchHistoryTotalschamp4: matchHistoryTotalsChamp4,
                  lane: lanePref,
                  champMasteryList: champMasteryList,
                  challenges: challenges,
                  playerIndexs: playerIndexs,
                )),
      );
    } else {
      //alert no summoner with this name
      //print("Error");
    }
  }

  MatchHistoryTotals setTotals(List<dynamic> champs, int index) {
    if (index >= 0) {
      resetVariables();
      for (var player in matchByChampList) {
        if (champs.length >= (index + 1) && player.champName == champs[index]) {
          //champTotals(player.playerInfo);
          matchTotals(player.playerInfo);
        }
      }
    }
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
    return matchHistoryTotals;
  }
}
