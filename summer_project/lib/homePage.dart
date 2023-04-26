import 'dart:ui';
import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'dart:convert';
import 'package:intro_slider/intro_slider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:summer_project/top-champ-widgets/altChamps/altChampsSection.dart';
import 'package:summer_project/top-champ-widgets/altChamps/altChampsWidget.dart';
import 'package:summer_project/api/apiMethods.dart';
import 'package:summer_project/top-champ-widgets/bestChamp/bestChampSection.dart';
import 'package:summer_project/top-champ-widgets/bestChamp/bestChampionCard.dart';
import 'package:summer_project/generated-classes/challenges.dart';
import 'package:summer_project/summoner-widgets/mainProfile.dart';
import 'package:summer_project/generated-classes/matchByChamp.dart';
import 'package:summer_project/match-history/matchHistory.dart';
import 'package:summer_project/util/matchHistoryTotals.dart';
import 'package:summer_project/generated-classes/matchStats.dart';
import 'package:summer_project/util/slides.dart';
import 'package:summer_project/api/itemApi.dart';
import 'package:summer_project/helpClasses/variableHell.dart';

import 'generated-classes/summoner.dart';
import 'helpClasses/supportMethods.dart';

Color colorLightGrey = const Color(0xFF292C33).withOpacity(0.4);
Color colorDarkGrey = const Color(0xFF191919);

Color primaryColor = const Color(0xFF292C33).withOpacity(0.4);

Color colorGrey = const Color(0xFF6B6A69).withOpacity(0.4);

class TestPage extends StatefulWidget {
  TestPage({
    Key? key,
    this.summoner,
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
  }) : super(key: key);

  //TestPage();
  final Summoner? summoner;
  final Rank? soloQRank;
  final Rank? flexRank;
  List<MatchStats>? matchHistoryList;
  MatchHistoryTotals? matchHistoryTotals;
  MatchHistoryTotals? matchHistoryTotalschamp1;
  MatchHistoryTotals? matchHistoryTotalschamp2;
  MatchHistoryTotals? matchHistoryTotalschamp3;
  MatchHistoryTotals? matchHistoryTotalschamp4;
  List<dynamic>? champsPlayedIds;
  final String? lane;
  final List<ChampionMastery>? champMasteryList;
  final AccountChallenges? challenges;

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with TickerProviderStateMixin {
  VariableHell vh = VariableHell();
  bool showTextField = false;
  final summonerTextController = TextEditingController();
  List<int>? champIDs = [];
  List<MatchByChamp> matchByChampList = [];
  List<String>? laneNames = [];
  List<int>? playerIndexs = [];

  //animation variables
  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late AnimationController _animationController3;
  late AnimationController _animationController4;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;
  late Animation<Offset> _animation4;

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
    _animationController4.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    calculateStats(widget.summoner?.summonerName, widget.matchHistoryList);
    animations();
  }

  void updateMH(List<MatchStats>? updatedList) {
    setState(() {
      List<MatchStats>? combinedList = widget.matchHistoryList! + updatedList!;
      widget.matchHistoryList = combinedList;
      calculateStats(widget.summoner?.summonerName, widget.matchHistoryList);
    });
  }

  void calculateStats(
      String? summonerName, List<MatchStats>? matchHistoryList) {
    //calculate stats
    ApiMethods api = ApiMethods();
    playerIndexs = [];
    champIDs = [];
    matchByChampList = [];
    widget.matchHistoryTotals = null;
    widget.matchHistoryTotalschamp1 = null;
    widget.matchHistoryTotalschamp2 = null;
    widget.matchHistoryTotalschamp3 = null;
    widget.matchHistoryTotalschamp4 = null;
    for (int i = 0; i < matchHistoryList!.length; i++) {
      MatchStats matchStats = matchHistoryList[i];
      int? playerIndex = api.findPersonUsingLoop(
          matchStats.info?.participants, summonerName!.toLowerCase());
      playerIndexs?.add(playerIndex);
      Participants? player = matchStats.info?.participants?[playerIndex];

      int? champID = player?.championId;
      String? lane = player?.individualPosition;
      champIDs?.add(champID!);

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
      MatchByChamp matchByChamp = MatchByChamp(champID, player);
      matchByChampList.add(matchByChamp);
    }
    widget.champsPlayedIds = SupportMethods().getMapString(champIDs);
    widget.matchHistoryTotals = setTotals(widget.champsPlayedIds, -1);
    widget.matchHistoryTotalschamp1 = setTotals(widget.champsPlayedIds, 0);
    widget.matchHistoryTotalschamp2 = setTotals(widget.champsPlayedIds, 1);
    widget.matchHistoryTotalschamp3 = setTotals(widget.champsPlayedIds, 2);
    widget.matchHistoryTotalschamp4 = setTotals(widget.champsPlayedIds, 3);
  }

  Widget _buildTextField() {
    return Expanded(
      child: Center(
        child: TextField(
          controller: summonerTextController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blue),
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

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colorDarkGrey,
        title: const Text('Play Easy Champions'),
        actions: <Widget>[
          Container(
            width: ResponsiveValue(
              context,
              defaultValue: 250.0,
              valueWhen: const [
                Condition.smallerThan(
                  name: MOBILE,
                  value: 200.0,
                ),
                Condition.largerThan(
                  name: TABLET,
                  value: 400.0,
                )
              ],
            ).value,
            padding:
                const EdgeInsets.fromLTRB(15.0 * 0.7, 0.0, 15.0 * 0.7, 0.0),
            child: Row(
              children: <Widget>[_buildTextField()],
            ),
          ),
          isLoading
              ? const SpinKitFadingCube(
                  color: Colors.cyan,
                  size: 25,
                )
              : IconButton(
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
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/helpIMG/highResRuinedMF.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _animation1,
                child: SizedBox(
                  width: 450 * 0.7,
                  height: 1200 * 0.7,
                  child: MainProfile(
                      widget.summoner!.profileIconID.toString(),
                      widget.summoner!.level.toString(),
                      widget.summoner!.summonerName,
                      widget.summoner!.summonerID,
                      widget.soloQRank,
                      widget.flexRank,
                      widget.matchHistoryTotals,
                      widget.champMasteryList,
                      widget.challenges),
                ),
              ),
              SlideTransition(
                  position: _animation2,
                  child: BestChampSection(
                    champID: widget.champsPlayedIds?[0],
                    mht1: widget.matchHistoryTotalschamp1,
                    summonerName: widget.summoner!.summonerName,
                  )),
              screenWidth >= 800
                  ? SlideTransition(
                      position: _animation3,
                      child: Column(children: [
                        const Text(
                          "Match History",
                          style: TextStyle(
                            fontSize: 28 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.blue,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                        MatchHistoryWidget(
                          matchHistoryList: widget.matchHistoryList,
                          summonerName: widget.summoner!.summonerName,
                          onUpdate: updateMH,
                          playerIndexs: playerIndexs,
                        ),
                      ]),
                    )
                  : SlideTransition(
                      position: _animation4,
                      child: AltchampSection(
                        champsPlayedIds: widget.champsPlayedIds,
                        mht2: widget.matchHistoryTotalschamp2,
                        mht3: widget.matchHistoryTotalschamp3,
                        mht4: widget.matchHistoryTotalschamp4,
                      )),
              screenWidth <= 800
                  ? SlideTransition(
                      position: _animation3,
                      child: Column(children: [
                        const Text(
                          "Match History",
                          style: TextStyle(
                            fontSize: 28 * 0.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.blue,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                        MatchHistoryWidget(
                          matchHistoryList: widget.matchHistoryList,
                          summonerName: widget.summoner!.summonerName,
                          onUpdate: updateMH,
                          playerIndexs: playerIndexs,
                        ),
                      ]),
                    )
                  : SlideTransition(
                      position: _animation4,
                      child: AltchampSection(
                        champsPlayedIds: widget.champsPlayedIds,
                        mht2: widget.matchHistoryTotalschamp2,
                        mht3: widget.matchHistoryTotalschamp3,
                        mht4: widget.matchHistoryTotalschamp4,
                      )),
            ],
          ),
        ),
      ),
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
        Iterable list = json.decode(response.body);

        rankedList = list.map((model) => Rank.fromJson(model)).toList();
      });
      Rank? ranksoloQ;
      if (rankedList!.isEmpty) {
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

      List<MatchStats>? matchHistory = await ApiMethods()
          .getGameHistory(summonerName: summonerTextController.text, start: 0);

      setState(() {
        isLoading = true;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TestPage(
                  summoner: summonerObject,
                  soloQRank: ranksoloQ,
                  flexRank: rankFlex,
                  matchHistoryList: matchHistory,
                  champMasteryList: champMasteryList,
                  challenges: challenges,
                )),
      );
    } else {
      SupportMethods().showErrorDialog(context,
          "This summoner was not found!\n Please check your spelling and if they player is on EUW.\n If the problem persist the server might be down.");
    }
  }

  MatchHistoryTotals setTotals(List<dynamic>? champs, int index) {
    if (index >= 0) {
      vh.resetVariables();
      for (var player in matchByChampList) {
        if (champs!.length >= (index + 1) && player.champId == champs[index]) {
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
        vh.turretPlatesTakenTotal!,
        vh.soloKillsTotal!,
        vh.soloBaronKillsTotal!,
        vh.scuttleCrabKillsTotal!,
        vh.saveAllyFromDeathTotal!,
        vh.quickSoloKillsTotal!,
        vh.epicMonsterKillsNearEnemyJunglerTotal!,
        vh.enemyJungleMonsterKillsTotal!,
        vh.effectiveHealAndShieldingTotal!,
        vh.epicMonsterKillsWithin30SecondsOfSpawnTotal!,
        vh.gameLengthTotal!,
        vh.goldPerMinuteTotal!,
        vh.hadOpenNexusWinsTotal!,
        vh.jungleCsBefore10MinutesTotal!,
        vh.junglerKillsEarlyJungleTotal!,
        vh.kdaTotal!,
        vh.killParticipationTotal!,
        vh.killsNearEnemyTurretTotal!,
        vh.killsOnLanersEarlyJungleAsJunglerTotal!,
        vh.killsOnOtherLanesEarlyJungleAsLanerTotal!,
        vh.killsUnderOwnTurretTotal!,
        vh.laneMinionsFirst10MinutesTotal!,
        vh.legendaryCountTotal!,
        vh.multiTurretRiftHeraldCountTotal!,
        vh.multikillsTotal!,
        vh.outnumberedKillsTotal!,
        vh.perfectGameTotal!,
        vh.dodgeSkillShotsSmallWindowTotal!,
        vh.damageTakenOnTeamPercentageTotal!,
        vh.damagePerMinuteTotal!,
        vh.tripleKillsTotal!,
        vh.inhibitorTakedownsTotal!,
        vh.totalHealTotal!,
        vh.neutralMinionsKilledTotal!,
        vh.quadraKillsTotal!,
        vh.timePlayedTotal!,
        vh.gameEndedInSurrenderTotal!,
        vh.goldEarnedTotal!,
        vh.firstTowerTotal!,
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

  void animations() {
    _animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController4 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation1 = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(_animationController1);

    _animation2 = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(_animationController2);

    _animation3 = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(_animationController3);

    _animation4 = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(_animationController4);

    _animationController1.forward().whenComplete(() {
      _animationController2.forward().whenComplete(() {
        _animationController3.forward().whenComplete(() {
          _animationController4.forward();
        });
      });
    });
  }
}
