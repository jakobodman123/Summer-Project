import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/game.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:dart_lol/LeagueStuff/summoner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:summer_project/about_page.dart';
import 'package:summer_project/util/appbarButton.dart';
import 'package:summer_project/util/customDialog.dart';
import 'package:summer_project/generated-classes/challenges.dart';
import 'package:summer_project/util/custom_appbar.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'package:summer_project/generated-classes/matchStats.dart';
import 'package:summer_project/util/slides.dart';
import 'package:summer_project/api/itemApi.dart';
import 'package:summer_project/helpClasses/variableHell.dart';

import 'api/apiMethods.dart';
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
  static const String route = '/overview';
  VariableHell vh = VariableHell();
  String server = "EUW1";
  final summonerTextController = TextEditingController();
  List<Game>? gameList;

  List<String>? champNames = [];

  int initializing = 0;
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  List<String>? laneNames = [];

  List<int>? playerIndexs = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    /*
    WidgetsBinding.instance!.addPostFrameCallback((_) => showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (context) => const CustomDialogBox()));
    */
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onDonePress() {
// Do what you want
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar().customAppbar(context),
      body: Stack(children: <Widget>[
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/helpIMG/highResRuinedMF.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
          ),
          child: SlideTransition(
            position: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  children: [
                    Image.asset(
                      "assets/helpIMG/mascot.png",
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
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Text(
                      "By Jakob Ödman",
                      style: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.black,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                          fontSize: 28,
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
                          await onTapLoad();
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
                            borderSide:
                                const BorderSide(width: 2, color: Colors.blue),
                          ),
                          suffixIcon: isLoading
                              ? const SpinKitFadingCube(
                                  color: Colors.cyan,
                                  size: 35,
                                )
                              : InkWell(
                                  child: const GlowIcon(
                                    Icons.search,
                                    color: Colors.blue,
                                    glowColor: Colors.blue,
                                    size: 35,
                                  ),
                                  onTap: () async {
                                    await onTapLoad();
                                  },
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Play Easy Champions isn’t endorsed by Riot Games and doesn’t reflect the views or opinions of Riot Games or anyone officially involved in producing or managing League of Legends.\nLeague of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends © Riot Games, Inc.",
                  style: TextStyle(shadows: [
                    Shadow(
                      blurRadius: 2.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ], fontSize: 11, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> onTapLoad() async {
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
        Iterable list = json.decode(response.body);
        champMasteryList =
            list.map((model) => ChampionMastery.fromJson(model)).toList();
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

      var lanes = SupportMethods().getMapString(laneNames);

      String lanePref;
      if (lanes.isEmpty) {
        lanePref = "UTILITY";
      } else {
        lanePref = lanes[0];
      }
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
                  lane: lanePref,
                  champMasteryList: champMasteryList,
                  challenges: challenges,
                )),
      );
    } else {
      SupportMethods().showErrorDialog(context,
          "This summoner was not found!\n Please check your spelling and if they player is on EUW.\n If the problem persist the server might be down.");
    }
  }
}
