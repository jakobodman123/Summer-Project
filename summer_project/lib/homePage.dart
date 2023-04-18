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
import 'package:summer_project/util/matchHistoryTotals.dart';
import 'package:summer_project/generated-classes/matchStats.dart';
import 'package:summer_project/searchPage.dart';
import 'package:summer_project/util/slides.dart';
import 'package:summer_project/api/itemApi.dart';
import 'package:summer_project/helpClasses/variableHell.dart';

Color colorLightGrey = const Color(0xFF292C33).withOpacity(0.4);
Color colorDarkGrey = const Color(0xFF191919);

Color primaryColor = const Color(0xFF292C33).withOpacity(0.4);

Color colorGrey = const Color(0xFF6B6A69).withOpacity(0.4);

class TestPage extends StatefulWidget {
  const TestPage(
      {Key? key,
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
      this.playerIndexs})
      : super(key: key);

  //TestPage();
  final Summoner? summoner;
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

class _TestPageState extends State<TestPage> with TickerProviderStateMixin {
  VariableHell vh = VariableHell();
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
    print("perkID");
    _animationController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animationController3 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animationController4 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation1 = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(_animationController1);

    _animation2 = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(_animationController2);

    _animation3 = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(_animationController3);

    _animation4 = Tween<Offset>(
      begin: Offset(0.0, 1.0),
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

        vh.matchTotals(player);
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
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SlideTransition(
                          position: _animation1,
                          child: SizedBox(
                            width: 500 * 0.7,
                            height: 1250 * 0.7,
                            child: MainProfile(
                                widget.summoner!.profileIconID.toString(),
                                widget.summoner!.level.toString(),
                                widget.summoner!.summonerName,
                                widget.summoner!.summonerID,
                                widget.soloQRank,
                                widget.flexRank,
                                widget.matchHistoryTotals,
                                widget.lane,
                                widget.champMasteryList,
                                widget.challenges),
                          ),
                        ),
                        SlideTransition(
                          position: _animation2,
                          child: BestChampionCard(
                            summonerName: widget.summoner!.summonerName,
                            //champName: widget.masteryList![0].championName?.replaceAll(RegExp(r"\s+\b|\b\s"), ""),
                            champName: widget.champsPlayedIds![0],
                            matchHistoryTotals: widget.matchHistoryTotalschamp1,
                            gamesPlayed:
                                widget.matchHistoryTotalschamp1?.gamesPlayed,
                          ),
                        ),
                        SlideTransition(
                          position: _animation3,
                          child: Column(children: [
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
                              summonerName: widget.summoner!.summonerName,
                              playerIndexes: widget.playerIndexs,
                            ),
                          ]),
                        ),
                        SlideTransition(
                          position: _animation4,
                          child: SizedBox(
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
                                        widget.matchHistoryTotalschamp2
                                            ?.gamesPlayed,
                                        widget.matchHistoryTotalschamp2
                                            ?.winsTotal,
                                        widget.matchHistoryTotalschamp2),
                                widget.champsPlayedIds!.length < 3
                                    ? const SizedBox()
                                    : AltChampsWidget(
                                        widget.champsPlayedIds![2],
                                        widget.matchHistoryTotalschamp3
                                            ?.gamesPlayed,
                                        widget.matchHistoryTotalschamp3
                                            ?.winsTotal,
                                        widget.matchHistoryTotalschamp3),
                                widget.champsPlayedIds!.length < 4
                                    ? const SizedBox()
                                    : AltChampsWidget(
                                        widget.champsPlayedIds![3],
                                        widget.matchHistoryTotalschamp4
                                            ?.gamesPlayed,
                                        widget.matchHistoryTotalschamp4
                                            ?.winsTotal,
                                        widget.matchHistoryTotalschamp4),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
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
          //champTotals(player.playerInfo);
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
