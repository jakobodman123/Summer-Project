import 'dart:collection';
import 'dart:io';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/game.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:dart_lol/LeagueStuff/summoner.dart';
import 'package:dart_lol/dart_lol.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:summer_project/apiMethods.dart';
import 'package:summer_project/challenges.dart';
import 'package:summer_project/main.dart';
import 'package:http/http.dart' as http;
import 'package:summer_project/matchByChamp.dart';
import 'package:summer_project/matchHistoryTotals.dart';
import 'dart:convert';

import 'package:summer_project/matchStats.dart';
import 'package:summer_project/slides.dart';
import 'package:summer_project/testClass.dart';
import 'package:summer_project/titles.dart';

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
  int initializing = 0;

  List<String>? laneNames = [];

  List<int>? playerIndexs = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // introDialog();
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

  void onDonePress() {
// Do what you want
  }

  void showAlert(BuildContext context) {
    initializing > 0
        ? showDialog(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (context) => AlertDialog(
                  title: const Text('Play Easy Champions ALPHA'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: const <Widget>[
                        Text(
                            'This is a prototype application in development/testing phase!'),
                        Text(
                            'To use enter a player name such as "ritzler" in the search field ' +
                                "to test the application!"),
                        Text("Only EUW Players are currently supported!")
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Got it!'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ))
        : Text("q");
    initializing += 1;
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
    //introDialog(context);
    //showAlert(context);
    //Future.delayed(Duration.zero, () => showAlert(context));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Play Easy Champion Selector'),
        actions: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    print('Text Clicked');
                  },
                  child: const GlowText(
                    "Other projects",
                    glowColor: Colors.blue,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    print('Text Clicked');
                  },
                  child: const GlowText(
                    "About",
                    glowColor: Colors.blue,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    print('Text Clicked');
                  },
                  child: const GlowText(
                    "Contact",
                    glowColor: Colors.blue,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: isLoading
          ? IntroSlider(
              slides: slides,
              onDonePress: onDonePress,
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/helpIMG/highResRuinedMF.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      const GlowText(
                        "League of Legends",
                        glowColor: Colors.blue,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const GlowText(
                        "Play Easy Champions",
                        glowColor: Colors.blue,
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const GlowText(
                        "By JakobCrya",
                        glowColor: Colors.blue,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 1500,
                        child: TextField(
                          onSubmitted: (value) async {
                            await onTapLoad1();
                          },
                          //autofocus: true,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                          controller: summonerTextController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                          ],
                          decoration: InputDecoration(
                            fillColor: colorDarkGrey,
                            filled: true,
                            hintText: "E.g. \"Ritzler\"",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            /*
                              prefix: DropdownButton(
                                  value: server,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      server = newValue!;
                                    });
                                  },
                                  items: dropdownItems), 
                                  */
                            suffixIcon: InkWell(
                              child: const GlowIcon(
                                Icons.search,
                                color: Colors.blue,
                                glowColor: Colors.blue,
                                size: 50,
                              ),
                              onTap: () async {
                                await onTapLoad1();
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            CupertinoIcons.chart_bar_circle_fill,
                            color: Colors.red,
                          ),
                          GlowText(
                            "Advanced Player Stats",
                            glowColor: Colors.blue,
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.yellow,
                          ),
                          GlowText(
                            "Player Accolades",
                            glowColor: Colors.blue,
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            CupertinoIcons.game_controller_solid,
                            color: Colors.green,
                          ),
                          GlowText(
                            "Match History",
                            glowColor: Colors.blue,
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                          width: 500,
                          height: 300,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            elevation: 20,
                            child: Image.asset(
                              "assets/helpIMG/add_picture.jpg",
                              fit: BoxFit.cover,
                            ),
                          ))
                    ],
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
        //print(response.body);
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
}
