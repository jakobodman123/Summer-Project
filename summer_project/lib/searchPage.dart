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
import 'package:summer_project/api/apiMethods.dart';
import 'package:summer_project/pointingArrow.dart';
import 'package:summer_project/util/appbarButton.dart';
import 'package:summer_project/util/customDialog.dart';
import 'package:summer_project/generated-classes/challenges.dart';
import 'package:summer_project/main.dart';
import 'package:http/http.dart' as http;
import 'package:summer_project/generated-classes/matchByChamp.dart';
import 'package:summer_project/util/matchHistoryTotals.dart';
import 'dart:convert';

import 'package:summer_project/generated-classes/matchStats.dart';
import 'package:summer_project/util/slides.dart';
import 'package:summer_project/api/itemApi.dart';
import 'package:summer_project/generated-classes/titles.dart';
import 'package:summer_project/helpClasses/variableHell.dart';

import 'helpClasses/supportMethods.dart';
import 'homePage.dart';

Color colorLightGrey = const Color(0xFF292C33).withOpacity(0.4);
Color colorDarkGrey = const Color(0xFF191919);

Color primaryColor = const Color(0xFF292C33).withOpacity(0.4);

Color colorGrey = const Color(0xFF6B6A69).withOpacity(0.4);

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  VariableHell vh = VariableHell();
  String server = "EUW1";
  final summonerTextController = TextEditingController();
  List<Game>? gameList;
  List<MatchStats>? matchHistoryList;
  List<String>? champNames = [];
  List<MatchByChamp> matchByChampList = [];
  int initializing = 0;
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  List<String>? laneNames = [];

  List<int>? playerIndexs = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) => showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (context) => const CustomDialogBox()));

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1300),
    );

    _animation = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<List<MatchStats>?> getGameHistory({
    String? summonerName,
  }) async {
    String europe = "europe";
    //Get games
    List<MatchStats>? matchHistoryList = [];
    await ItemApi.getGames(summonerName!).then((response) {
      Iterable list = json.decode(response.body);
      matchHistoryList =
          list.map((model) => MatchStats.fromJson(model)).toList();
    });
    //calculate stats
    ApiMethods api = ApiMethods();

    for (int i = 0; i < matchHistoryList!.length; i++) {
      MatchStats matchStats = matchHistoryList![i];
      int? playerIndex = await api.findPersonUsingLoop(
          matchStats.info?.participants, summonerName.toLowerCase());
      playerIndexs?.add(playerIndex);
      Participants? player = matchStats.info?.participants?[playerIndex];

      if (player != null) {
        String? champName = player.championName;
        String? lane = player.individualPosition;

        if (champName != null) {
          champNames?.add(champName);
        }

        switch (matchStats.info?.queueId) {
          case 400:
          case 420:
          case 440:
            laneNames?.add(lane!);
            break;
          default:
            break;
        }
        vh.matchTotals(player);
        MatchByChamp matchByChamp = MatchByChamp(champName, player);
        matchByChampList.add(matchByChamp);
      }
    }

    return matchHistoryList;
  }

  void onDonePress() {
// Do what you want
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        //add title widget
        actions: <Widget>[
          Row(
            children: [
              CustomAppbarButton(
                text: "Other Projects",
                onPressed: () {
                  print('Text Clicked');
                },
              ),
              CustomAppbarButton(
                text: "About",
                onPressed: () {
                  print('Text Clicked');
                },
              ),
              CustomAppbarButton(
                text: "Contact",
                onPressed: () {
                  print('Text Clicked');
                },
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
          : Stack(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/helpIMG/highResRuinedMF.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: SingleChildScrollView(
                  child: SlideTransition(
                    position: _animation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 200,
                        ),
                        Image.asset(
                          "assets/rankedIcons/Emblem_Diamond.png",
                          fit: BoxFit.cover,
                          scale: 2,
                        ),
                        const Text(
                          "Play Easy Champions",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const GlowText(
                          "By JakobCrya",
                          glowColor: Colors.blue,
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: 1000,
                          child: TextField(
                            onSubmitted: (value) async {
                              await onTapLoad1();
                            },
                            //autofocus: true,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            controller: summonerTextController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                            ],
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "E.g. \"Ritzler\"",
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blue),
                              ),
                              suffixIcon: InkWell(
                                child: const GlowIcon(
                                  Icons.search,
                                  color: Colors.blue,
                                  glowColor: Colors.blue,
                                  size: 35,
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
                      ],
                    ),
                  ),
                ),
              ),
            ]),
    );
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

      var lanes = SupportMethods().getMapString(laneNames);

      String lanePref;
      if (lanes.isEmpty) {
        lanePref = "UTILITY";
      } else {
        lanePref = lanes[0];
      }

      //Most Played Map

      List<dynamic> champs = SupportMethods().getMapString(champNames);

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
                  summoner: summonerObject,
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
      vh.resetVariables();
      for (var player in matchByChampList) {
        if (champs.length >= (index + 1) && player.champName == champs[index]) {
          //champTotals(player.playerInfo);'
          //matchTotals(player.playerInfo);
          vh.matchTotals(player.playerInfo);
        }
      }
    }
    MatchHistoryTotals matchHistoryTotals = MatchHistoryTotals(
        vh.baronKillsTotal!,
        vh.killsTotal!,
        vh.pinkWardsTotal!,
        vh.endGameLevelTotal!,
        vh.dmgToStructuresTotal!,
        vh.deathsTotal!,
        vh.dragonKillsTotal!,
        vh.firstBloodTotal!,
        vh.killingSpreeTotal!,
        vh.objectiveStealTotal!,
        vh.pentaKillsTotal!,
        vh.damageTotal!,
        vh.damageTakenTotal!,
        vh.turretKillsTotal!,
        vh.visionScoreTotal!,
        vh.wardsGuardedTotal!,
        vh.turretPlatesTakenTotal!,
        vh.soloKillsTotal!,
        vh.soloBaronKillsTotal!,
        vh.scuttleCrabKillsTotal!,
        vh.saveAllyFromDeathTotal!,
        vh.quickSoloKillsTotal!,
        vh.epicMonsterKillsNearEnemyJunglerTotal!,
        vh.enemyJungleMonsterKillsTotal!,
        vh.earlyLaningPhaseGoldExpAdvantageTotal!,
        vh.effectiveHealAndShieldingTotal!,
        vh.earliestBaronRecord!,
        vh.epicMonsterKillsWithin30SecondsOfSpawnTotal!,
        vh.fasterSupportQuestCompletionTotal!,
        vh.firstTurretKilledTimeRecord!,
        vh.gameLengthTotal!,
        vh.goldPerMinuteTotal!,
        vh.hadOpenNexusWinsTotal!,
        vh.immobilizeAndKillWithAllyTotal!,
        vh.jungleCsBefore10MinutesTotal!,
        vh.junglerKillsEarlyJungleTotal!,
        vh.kdaTotal!,
        vh.killAfterHiddenWithAllyTotal!,
        vh.killParticipationTotal!,
        vh.killsNearEnemyTurretTotal!,
        vh.killsOnLanersEarlyJungleAsJunglerTotal!,
        vh.killsOnOtherLanesEarlyJungleAsLanerTotal!,
        vh.killsUnderOwnTurretTotal!,
        vh.landSkillShotsEarlyGameTotal!,
        vh.laneMinionsFirst10MinutesTotal!,
        vh.maxCsAdvantageOnLaneOpponentTotal!,
        vh.legendaryCountTotal!,
        vh.lostAnInhibitorWinsTotal!,
        vh.multiTurretRiftHeraldCountTotal!,
        vh.perfectDragonSoulsTakenTotal!,
        vh.multikillsAfterAggressiveFlashTotal!,
        vh.multikillsTotal!,
        vh.outnumberedKillsTotal!,
        vh.perfectGameTotal!,
        vh.quickCleanseTotal!,
        vh.dodgeSkillShotsSmallWindowTotal!,
        vh.damageTakenOnTeamPercentageTotal!,
        vh.damagePerMinuteTotal!,
        vh.acesBefore15MinutesTotal!,
        vh.tripleKillsTotal!,
        vh.inhibitorTakedownsTotal!,
        vh.totalHealTotal!,
        vh.timeCCingOthersTotal!,
        vh.neutralMinionsKilledTotal!,
        vh.quadraKillsTotal!,
        vh.timePlayedTotal!,
        vh.gameEndedInSurrenderTotal!,
        vh.goldEarnedTotal!,
        vh.firstTowerTotal!,
        vh.damageSelfMitigatedTotal!,
        vh.doubleKillsTotal!,
        vh.detectorWardsPlacedTotal!,
        vh.wardsPlacedTotal!,
        vh.wardsKilledTotal!,
        vh.alliedJungleMonsterKillsTotal!,
        vh.buffStolenTotal!,
        vh.teamDamagePercentageTotal!,
        vh.gamesPlayedTotal!,
        vh.assistsTotal!,
        vh.lossesTotal,
        vh.winsTotal,
        vh.csTotal);
    return matchHistoryTotals;
  }
}
