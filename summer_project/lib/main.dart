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

Color colorLightGrey = const Color(0xFF292C33).withOpacity(0.4);
Color colorDarkGrey = const Color(0xFF191919);

Color primaryColor = const Color(0xFF292C33).withOpacity(0.4);

Color colorGrey = const Color(0xFF6B6A69).withOpacity(0.4);

void main() {
  runApp(const SummerProject());
}

class SummerProject extends StatelessWidget {
  const SummerProject();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
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
