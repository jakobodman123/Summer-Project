import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/game.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:summer_project/generated-classes/challenges.dart';
import 'package:summer_project/util/custom_appbar.dart';
import 'package:summer_project/util/custom_drawer.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'package:summer_project/generated-classes/matchStats.dart';
import 'package:summer_project/util/slides.dart';
import 'package:summer_project/api/itemApi.dart';
import 'package:summer_project/helpClasses/variableHell.dart';

import 'api/apiMethods.dart';
import 'generated-classes/summoner.dart';
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
  String _currentRouteName = "/";
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar().customAppbar(context),
      drawer: Drawer(
          child: TextButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/${summonerTextController.text}',
          );
        },
        child: Text("clickme"),
      )),
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SlideTransition(
              position: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/helpIMG/mascot.png",
                        fit: BoxFit.cover,
                        scale: 2,
                      ),
                      const Text(
                        "Play Easy Champions",
                        textAlign: TextAlign.center,
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
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Colors.green,
                            Color.fromARGB(255, 8, 66, 131),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          tileMode: TileMode.mirror,
                        ).createShader(bounds),
                        child: const Text(
                          "By Jakob Lindecrantz",
                          textAlign: TextAlign.center,
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
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 1000,
                        child: TextField(
                          onSubmitted: (value) async {
                            setState(() {
                              isLoading = true;
                            });
                            Navigator.pushNamed(
                              context,
                              '/${summonerTextController.text}',
                            );
                            setState(() {
                              isLoading = false;
                            });
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
                            hintText: "E.g. \"theodmino\"",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blue),
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
                                      setState(() {
                                        isLoading = true;
                                      });
                                      Navigator.pushNamed(
                                        context,
                                        '/${summonerTextController.text}',
                                      );
                                      setState(() {
                                        isLoading = false;
                                      });
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
        )
      ]),
    );
  }
}
