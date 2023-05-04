import 'dart:ui';
import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:summer_project/pages/error_page.dart';
import 'package:summer_project/generated-classes/summoner_object.dart';
import 'package:summer_project/top-champ-widgets/altChamps/altChampsSection.dart';
import 'package:summer_project/api/apiMethods.dart';
import 'package:summer_project/top-champ-widgets/bestChamp/bestChampSection.dart';
import 'package:summer_project/generated-classes/challenges.dart';
import 'package:summer_project/summoner-widgets/mainProfile.dart';
import 'package:summer_project/generated-classes/matchByChamp.dart';
import 'package:summer_project/match-history/matchHistory.dart';
import 'package:summer_project/util/gradient_button.dart';
import 'package:summer_project/util/matchHistoryTotals.dart';
import 'package:summer_project/generated-classes/matchStats.dart';
import 'package:summer_project/helpClasses/variableHell.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summer_project/util/title_logo.dart';
import '../generated-classes/summoner.dart';
import '../helpClasses/supportMethods.dart';
import '../main.dart';

Color colorLightGrey = const Color(0xFF292C33).withOpacity(0.4);
//Color colorDarkGrey = const Color(0xFF191919);

Color primaryColor = const Color(0xFF292C33).withOpacity(0.4);

Color colorGrey = const Color(0xFF6B6A69).withOpacity(0.4);

class TestPage extends StatefulWidget {
  TestPage({Key? key, this.summonerName}) : super(key: key);

  //TestPage();
  final String? summonerName;
  /*
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
  */

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with TickerProviderStateMixin {
  VariableHell vh = VariableHell();
  bool showTextField = false;
  final summonerTextController = TextEditingController();
  bool isLoading = true;
  List<int>? champIDs = [];
  List<String>? champNames = [];
  List<MatchByChamp> matchByChampList = [];
  List<String>? laneNames = [];
  List<int>? playerIndexs = [];
  SummonerObject? _summonerObject;
  //late bool summonerExist;

  //animation variables
  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late AnimationController _animationController3;
  late AnimationController _animationController4;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;
  late Animation<Offset> _animation4;

  //test
  late final Summoner? summoner;
  late final Rank? soloQRank;
  late final Rank? flexRank;
  List<MatchStats>? matchHistoryList;
  MatchHistoryTotals? matchHistoryTotals;
  MatchHistoryTotals? matchHistoryTotalschamp1;
  MatchHistoryTotals? matchHistoryTotalschamp2;
  MatchHistoryTotals? matchHistoryTotalschamp3;
  MatchHistoryTotals? matchHistoryTotalschamp4;
  List<dynamic>? champsPlayedIds;
  late final List<ChampionMastery>? champMasteryList;
  late final AccountChallenges? challenges;
  late String _errorMessage;
  //test

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
    fetchSummoner(widget.summonerName!);

    animations();
  }

  Future<void> fetchSummoner(String name) async {
    // Fetch the summoner object from the server
    try {
      SummonerObject? summoner = await SupportMethods().loadSummoner(name);
      setState(() {
        isLoading = false;
        _summonerObject = summoner;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        _errorMessage = e.toString();
      });
    }
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
            Navigator.pushNamed(
              context,
              '/summoner/${summonerTextController.text}',
            );
          },
          onTap: () {
            showTextField = false;
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    if (isLoading == true) {
      return Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/helpIMG/highResRuinedMF.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SpinKitFadingCube(
                    color: Colors.cyan,
                    size: 50,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Loading Summoner!\nMight take up to 30seconds!",
                    textAlign: TextAlign.center,
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
                ],
              )));
    } else if (_summonerObject != null) {
      double screenWidth = MediaQuery.of(context).size.width;
      calculateStats(_summonerObject!.summoner!.summonerName,
          _summonerObject!.matchHistoryList);

      return Scaffold(
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: colorDarkGrey,
          title: TitleLogo(),
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
            IconButton(
              icon: const GlowIcon(
                Icons.navigate_next,
                color: Colors.blue,
                glowColor: Colors.blue,
              ),
              tooltip: 'Go to the next page',
              onPressed: () async {
                Navigator.pushNamed(
                  context,
                  '/summoner/${summonerTextController.text}',
                );
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
                        _summonerObject!.summoner!.profileIconID.toString(),
                        _summonerObject!.summoner!.level.toString(),
                        _summonerObject!.summoner!.summonerName,
                        _summonerObject!.summoner!.summonerID,
                        _summonerObject!.soloQRank,
                        _summonerObject!.flexRank,
                        _summonerObject!.matchHistoryTotals,
                        _summonerObject!.champMasteryList,
                        _summonerObject!.challenges),
                  ),
                ),
                SlideTransition(
                    position: _animation2,
                    child: BestChampSection(
                      champName: _summonerObject!.champsPlayedIds?[0],
                      mht1: _summonerObject!.matchHistoryTotalschamp1,
                      summonerName: _summonerObject!.summoner!.summonerName,
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
                            matchHistoryList: _summonerObject!.matchHistoryList,
                            summonerName:
                                _summonerObject!.summoner!.summonerName,
                            onUpdate: updateMH,
                            playerIndexs: playerIndexs,
                          ),
                        ]),
                      )
                    : SlideTransition(
                        position: _animation4,
                        child: AltchampSection(
                          champsPlayedIds: _summonerObject!.champsPlayedIds,
                          mht2: _summonerObject!.matchHistoryTotalschamp2,
                          mht3: _summonerObject!.matchHistoryTotalschamp3,
                          mht4: _summonerObject!.matchHistoryTotalschamp4,
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
                            matchHistoryList: _summonerObject!.matchHistoryList,
                            summonerName:
                                _summonerObject!.summoner!.summonerName,
                            onUpdate: updateMH,
                            playerIndexs: playerIndexs,
                          ),
                        ]),
                      )
                    : SlideTransition(
                        position: _animation4,
                        child: AltchampSection(
                          champsPlayedIds: _summonerObject!.champsPlayedIds,
                          mht2: _summonerObject!.matchHistoryTotalschamp2,
                          mht3: _summonerObject!.matchHistoryTotalschamp3,
                          mht4: _summonerObject!.matchHistoryTotalschamp4,
                        )),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: colorDarkGrey,
            title: TitleLogo(),
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
              IconButton(
                icon: const GlowIcon(
                  Icons.navigate_next,
                  color: Colors.blue,
                  glowColor: Colors.blue,
                ),
                tooltip: 'Go to the next page',
                onPressed: () async {
                  Navigator.pushNamed(
                    context,
                    '/${summonerTextController.text}',
                  );
                },
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          body: ErrorPage(
              summonerName: widget.summonerName!, screenSize: screenSize));
    }
  }

  void updateMH(List<MatchStats>? updatedList) {
    setState(() {
      List<MatchStats>? combinedList =
          _summonerObject!.matchHistoryList! + updatedList!;
      _summonerObject?.matchHistoryList = combinedList;
      calculateStats(widget.summonerName, _summonerObject?.matchHistoryList);
    });
  }

  void calculateStats(
      String? summonerName, List<MatchStats>? matchHistoryList) {
    //calculate stats

    ApiMethods api = ApiMethods();
    playerIndexs = [];
    champIDs = [];
    champNames = [];
    matchByChampList = [];
    _summonerObject!.matchHistoryTotals = null;
    _summonerObject!.matchHistoryTotalschamp1 = null;
    _summonerObject!.matchHistoryTotalschamp2 = null;
    _summonerObject!.matchHistoryTotalschamp3 = null;
    _summonerObject!.matchHistoryTotalschamp4 = null;
    for (int i = 0; i < matchHistoryList!.length; i++) {
      MatchStats matchStats = matchHistoryList[i];
      int? playerIndex = api.findPersonUsingLoop(
          matchStats.info?.participants, summonerName!.toLowerCase());
      playerIndexs?.add(playerIndex);
      Participants? player = matchStats.info?.participants?[playerIndex];

      int? champID = player?.championId;
      String? champName = player?.championName;
      String? lane = player?.individualPosition;
      champIDs?.add(champID!);
      champNames?.add(champName!);

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
    //widget.champsPlayedIds = SupportMethods().getMapString(champIDs);
    _summonerObject!.champsPlayedIds =
        SupportMethods().getMapString(champNames);
    _summonerObject!.matchHistoryTotals =
        setTotals(_summonerObject!.champsPlayedIds, -1);
    _summonerObject!.matchHistoryTotalschamp1 =
        setTotals(_summonerObject!.champsPlayedIds, 0);
    _summonerObject!.matchHistoryTotalschamp2 =
        setTotals(_summonerObject!.champsPlayedIds, 1);
    _summonerObject!.matchHistoryTotalschamp3 =
        setTotals(_summonerObject!.champsPlayedIds, 2);
    _summonerObject!.matchHistoryTotalschamp4 =
        setTotals(_summonerObject!.champsPlayedIds, 3);
  }

  MatchHistoryTotals setTotals(List<dynamic>? champs, int index) {
    if (index >= 0) {
      vh.resetVariables();
      for (var player in matchByChampList) {
        if (champs!.length >= (index + 1) &&
            player.champName == champs[index]) {
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
