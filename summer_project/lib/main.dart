import 'dart:io';
import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:dart_lol/dart_lol.dart';
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
import 'package:summer_project/matchHistoryTotals.dart';
import 'package:summer_project/matchStats.dart';
import 'package:summer_project/rankedCard.dart';
import 'package:summer_project/searchPage.dart';

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
      required this.soloQRank,
      required this.flexRank,
      required this.masteryList,
      required this.matchHistoryList,
      this.matchHistoryTotals})
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
  final Rank soloQRank;
  final Rank flexRank;
  final List<ChampionMastery>? masteryList;
  final List<MatchStats>? matchHistoryList;
  final MatchHistoryTotals? matchHistoryTotals;

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

  @override
  void initState() {
    super.initState();
    print(widget.summonerID);
    print(widget.matchHistoryTotals!.killsTotal);
    print(widget.matchHistoryTotals!.visionScoreTotal);
    print(widget.matchHistoryTotals!.pinkWardsTotal);
    print(widget
        .matchHistoryList![0].info!.participants![0].challenges!.abilityUses);
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
          autofocus: true,
          controller: summonerTextController,
          style: TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          onTap: () {
            showTextField = false;
          },
        ),
      ),
    );
  }

  Future<Rank> getRankInfos2({String? summonerID}) async {
    var url =
        'https://$server.api.riotgames.com/lol/league/v4/entries/by-summoner/$summonerID?api_key=$apiToken';
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.body.toString() != '[]') {
      return Rank.fromJson(
        json.decode(
          response.body,
        )[1],
      );
    } else {
      return Rank(
          hotStreak: false,
          leagueId: '0',
          leaguePoints: 0,
          losses: 0,
          wins: 0,
          rank: 'unranked',
          tier: 'no tier');
    }
  }

  Future<List<MatchStats>?> getGameHistory(
      {String? puuid, int start = 0, int count = 20}) async {
    String europe = "europe";
    var url =
        'https://$europe.api.riotgames.com/lol/match/v5/matches/by-puuid/$puuid/ids?start=$start&count=$count&api_key=$apiToken';
    var response = await http.get(
      Uri.parse(url),
    );
    final matchIdList = json.decode(response.body);
    print(matchIdList);
    List<MatchStats>? matchHistoryList = [];
    for (String id in matchIdList) {
      var url =
          'https://$europe.api.riotgames.com/lol/match/v5/matches/$id?api_key=$apiToken';
      var response = await http.get(
        Uri.parse(url),
      );
      final match = json.decode(response.body);
      //print("\nID: $id");
      //print(match);
      //print("---");
      matchHistoryList.add(
        MatchStats.fromJson(json.decode(json.encode(match))),
      );
    }

    return matchHistoryList;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colorDarkGrey,
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
            onPressed: () async {
              setState(() {});
              final league = League(apiToken: apiToken, server: "EUW1");
              var summoner = await league.getSummonerInfo(
                  summonerName: summonerTextController.text);
              print(summoner.puuid);

              if (1 == 1) {
                String? accID = summoner.accID;
                int? level = summoner.level;
                int? profileIconID = summoner.profileIconID;
                String? puuid = summoner.puuid;
                String? summmonerID = summoner.summonerID;
                String? summonerName = summoner.summonerName;

                Rank ranksoloQ =
                    await league.getRankInfos(summonerID: summmonerID);

                Rank rankFlex = await getRankInfos2(summonerID: summmonerID);

                List<ChampionMastery>? masteryList =
                    await league.getChampionMasteries(summonerID: summmonerID);

                List<MatchStats>? matchHistory = await getGameHistory(
                  puuid: summoner.puuid,
                );
                setState(() {});
                print(matchHistory!);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TestPage(
                            accID: accID,
                            level: level,
                            profileIconID: profileIconID,
                            puuid: puuid,
                            summonerID: summmonerID,
                            summonerName: summonerName,
                            server: "EUW1",
                            soloQRank: ranksoloQ,
                            flexRank: rankFlex,
                            masteryList: masteryList,
                            matchHistoryList: matchHistory,
                          )),
                );
              }
            },
          ),
        ],
      ),
      body: Container(
        color: colorDarkGrey,
        height: size.height,
        width: size.width,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 40,
            ),
            child: SizedBox(
              height: size.height,
              width: size.width * 0.2,
              child: MainProfile(
                widget.profileIconID.toString(),
                widget.level.toString(),
                widget.summonerName,
                widget.summonerID,
                widget.soloQRank,
                widget.flexRank,
                widget.matchHistoryTotals,
              ),
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
                  padding: EdgeInsets.only(bottom: 40, top: 80, left: 40),
                  child: BestChampionCard(
                    summonerName: widget.summonerName,
                    champMastery: widget.masteryList![0].championPoints,
                    champName: widget.masteryList![0].championName
                        ?.replaceAll(RegExp(r"\s+\b|\b\s"), ""),
                    matchHistoryTotals: widget.matchHistoryTotals,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 80,
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
                          widget.masteryList![1].championName,
                          173,
                          52,
                          "10.2/4.5/12.7"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: AltChampsWidget(
                          widget.masteryList![2].championName,
                          42,
                          61,
                          "10.2/4.5/12.7"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: AltChampsWidget(
                          widget.masteryList![3].championName,
                          23,
                          41,
                          "10.2/4.5/12.7"),
                    ),
                  ],
                ),
                Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 80,
                      left: 80,
                      bottom: 20,
                    ),
                    child: Text(
                      "Match History",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  MatchHistoryWidget(
                    matchHistoryList: widget.matchHistoryList,
                    summonerName: widget.summonerName,
                  ),
                ]),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
