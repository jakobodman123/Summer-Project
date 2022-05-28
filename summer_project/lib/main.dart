import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:summer_project/altChampsWidget.dart';
import 'package:summer_project/bestChampionCard.dart';
import 'package:summer_project/bestChampionWidget.dart';
import 'package:summer_project/item.dart';
import 'package:summer_project/kdWinrateWidget.dart';
import 'package:summer_project/listItem.dart';
import 'package:summer_project/mainProfile.dart';
import 'package:summer_project/masteryCard.dart';
import 'package:summer_project/matchHistory.dart';
import 'package:summer_project/rankedCard.dart';

Color colorLightGrey = Color(0xFF292C33).withOpacity(0.4);
Color colorDarkGrey = Color(0xFF191919);

Color primaryColor = const Color(0xFF292C33).withOpacity(0.4);

Color colorGrey = Color(0xFF6B6A69).withOpacity(0.4);

void main() => runApp(const SummerProject());

class SummerProject extends StatelessWidget {
  const SummerProject();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const TestPage(),
      },
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  //TestPage();

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String itemTypeString = "";
  List<Item> itemList = <Item>[];
  String iconID = "4884";
  bool showTextField = false;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildFloatingSearchBtn() {
    return Expanded(
      child: InkWell(
        child: GlowIcon(
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
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          onTap: () {
            showTextField = false;
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorDarkGrey,
        elevation: 40,
        title: const Text('Play Easy Champion Selector'),
        actions: <Widget>[
          Container(
            width: 400,
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: Row(
              children: <Widget>[
                showTextField ? _buildTextField() : Container(),
                _buildFloatingSearchBtn(),
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
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: colorDarkGrey,
        height: size.height,
        width: size.width,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(bottom: 40, top: 40),
            child: SizedBox(
              height: size.height,
              width: size.width * 0.2,
              child: MainProfile(),
            ),
          ),
          //Vit box
          Container(
            height: size.height,
            width: size.width * 0.8,
            //color: colorDarkGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 40, top: 40, left: 40),
                  child: BestChampionCard(),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 40,
                        left: 80,
                      ),
                      child: Text(
                        "Alternative Champs",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 50),
                      child: AltChampsWidget(
                          "MissFortune", 173, 52, "10.2/4.5/12.7"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: AltChampsWidget("Janna", 42, 61, "10.2/4.5/12.7"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child:
                          AltChampsWidget("Nautilus", 23, 41, "10.2/4.5/12.7"),
                    ),
                  ],
                ),
                MatchHistoryWidget(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
