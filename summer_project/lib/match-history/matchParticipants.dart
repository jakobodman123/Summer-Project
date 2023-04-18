import 'dart:collection';

import 'package:dart_lol/LeagueStuff/champion_mastery.dart';
import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:dart_lol/LeagueStuff/summoner.dart';
import 'package:dart_lol/dart_lol.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/api/apiMethods.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/generated-classes/matchByChamp.dart';
import 'package:summer_project/util/matchHistoryTotals.dart';
import 'package:summer_project/generated-classes/matchStats.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:summer_project/searchPage.dart';
import 'package:summer_project/api/itemApi.dart';

import '../homePage.dart';

class MatchParticipants extends StatefulWidget {
  final String? champion;
  final String? playerName;
  final String? server = "EUW1";

  const MatchParticipants({Key? key, this.champion, this.playerName})
      : super(key: key);
  @override
  MatchParticipantsState createState() => MatchParticipantsState();
}

class MatchParticipantsState extends State<MatchParticipants> {
  final String server = "EUW1";
  List<String>? champNames = [];
  List<MatchByChamp> matchByChampList = [];
  List<String>? laneNames = [];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 15 * 0.7,
            width: 20 * 0.7,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset("assets/img/champion/${widget.champion}.png"),
            ),
          ),
          SizedBox(
            height: 15 * 0.7,
            width: 75 * 0.7,
            child: Text(
              (widget.playerName != null) ? widget.playerName! : "NameError",
              style: const TextStyle(fontSize: 14 * 0.7, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
