import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:summer_project/util/custom_drawer.dart';

import 'package:summer_project/util/custom_appbar.dart';
import 'package:summer_project/util/gradient_button.dart';

import '../util/title_logo.dart';

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
  final summonerTextController = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _animation;

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
      endDrawer: screenWidth >= 800 ? null : const CustomDrawer(),
      appBar: screenWidth <= 800
          ? AppBar(
              backgroundColor: Colors.transparent,
              title: TitleLogo(),
              automaticallyImplyLeading: false,
            )
          : CustomAppbar().customAppbar(context, true),
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
                      Text(
                        "Play Easy Champs",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.blackOpsOne(
                          textStyle: const TextStyle(
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
                        child: Text(
                          "By Jakob Lindecrantz",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.blackOpsOne(
                            textStyle: const TextStyle(
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
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 800,
                        child: TextField(
                          onSubmitted: (value) async {
                            Navigator.pushNamed(
                              context,
                              '/summoner/${summonerTextController.text}',
                            );
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
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: GradientOutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: const LinearGradient(
                                    colors: [Colors.green, Colors.blue]),
                                width: 2),
                            suffixIcon: InkWell(
                              child: const Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: GradientButton(
                                      text: "Search", width: 60, height: 39)),
                              onTap: () async {
                                Navigator.pushNamed(
                                  context,
                                  '/summoner/${summonerTextController.text}',
                                );
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
