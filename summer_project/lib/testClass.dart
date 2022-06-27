import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

class ItemApi {
  static Future getGames(String summonerName) {
    return http.get(
      Uri.parse('http://localhost:4000/pastGames?summoner=' + summonerName),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getRanked(String summonerID) {
    return http.get(
      Uri.parse('http://localhost:4000/getRanked?summonerid=' + summonerID),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getSummoner(String? summonerName) {
    return http.get(
      Uri.parse('http://localhost:4000/getSummoner?summoner=' + summonerName!),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getChallenges(String? puuid) {
    return http.get(
      Uri.parse('http://localhost:4000/getChallenges?puuid=' + puuid!),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getMasteries(String? summonerID) {
    return http.get(
      Uri.parse('http://localhost:4000/getMasteries?summonerid=' + summonerID!),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }
}
