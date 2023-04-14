import 'dart:convert';

import 'package:dart_lol/LeagueStuff/rank.dart';
import 'package:summer_project/generated-classes/matchStats.dart';
import 'package:http/http.dart' as http;
import 'package:summer_project/searchPage.dart';

class ApiMethods {
  String server = "EUW1";
  Future<int> findPersonUsingLoop(
      List<Participants>? people, String? summonerName) async {
    if (people != null && summonerName != null) {
      for (var i = 0; i < people.length; i++) {
        if (people[i].summonerName?.toLowerCase() == summonerName) {
          // Found the person, stop the loop
          return i;
        }
      }
    }
    return 0;
  }
}
