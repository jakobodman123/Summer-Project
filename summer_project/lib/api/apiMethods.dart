import 'dart:convert';

import 'package:summer_project/generated-classes/matchStats.dart';

import 'itemApi.dart';

class ApiMethods {
  int findPersonUsingLoop(List<Participants>? people, String? summonerName) {
    if (people != null && summonerName != null) {
      final index = people.indexWhere((person) =>
          person.summonerName?.toLowerCase() == summonerName.toLowerCase());
      if (index != -1) {
        // Found the person
        return index;
      }
    }
    return -1;
  }

  Future<List<MatchStats>?> getGameHistory(
      {String? summonerName, int? start}) async {
    //Get games
    List<MatchStats>? matchHistoryList = [];
    await ItemApi.getGames(summonerName!, start!).then((response) {
      Iterable list = json.decode(response.body);
      matchHistoryList =
          list.map((model) => MatchStats.fromJson(model)).toList();
    });
    return matchHistoryList;
  }
}
