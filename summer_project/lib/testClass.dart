import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

class ItemApi {
  //testCode
/*
  static Future getGames(String summonerName) {
    return http.get(
      Uri.parse('http://localhost:4000/pastGames?summoner=' + summonerName),
      //Uri.parse('https://playeasychamps.herokuapp.com/pastGames?summoner=' +summonerName),

      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getRanked(String summonerID) {
    return http.get(
      Uri.parse('http://localhost:4000/getRanked?summonerid=' + summonerID),
      //Uri.parse('https://playeasychamps.herokuapp.com/getRanked?summonerid=' +summonerID),

      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getSummoner(String? summonerName) {
    return http.get(
      Uri.parse('http://localhost:4000/getSummoner?summoner=' + summonerName!),
      //Uri.parse('https://playeasychamps.herokuapp.com/getSummoner?summoner=' +summonerName!),

      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getChallenges(String? puuid) {
    return http.get(
      Uri.parse('http://localhost:4000/getChallenges?puuid=' + puuid!),
      //Uri.parse('https://playeasychamps.herokuapp.com/getChallenges?puuid=' + puuid!),

      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getMasteries(String? summonerID) {
    return http.get(
      Uri.parse('http://localhost:4000/getMasteries?summonerid=' + summonerID!),
      //Uri.parse('https://playeasychamps.herokuapp.com/getMasteries?summonerid=' +summonerID!),

      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getTitle() {
    return http.get(
      Uri.parse('https://cdn.darkintaqt.com/lol/static/titles.json'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }
  */

  //productionCode

  static Future getGames(String summonerName) {
    return http.get(
      Uri.parse('https://playeasychamps.herokuapp.com/pastGames?summoner=' +
          summonerName),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getRanked(String summonerID) {
    return http.get(
      Uri.parse('https://playeasychamps.herokuapp.com/getRanked?summonerid=' +
          summonerID),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getSummoner(String? summonerName) {
    return http.get(
      Uri.parse('https://playeasychamps.herokuapp.com/getSummoner?summoner=' +
          summonerName!),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getChallenges(String? puuid) {
    return http.get(
      Uri.parse(
          'https://playeasychamps.herokuapp.com/getChallenges?puuid=' + puuid!),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getMasteries(String? summonerID) {
    return http.get(
      Uri.parse(
          'https://playeasychamps.herokuapp.com/getMasteries?summonerid=' +
              summonerID!),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  static Future getTitle() {
    return http.get(
      Uri.parse('https://cdn.darkintaqt.com/lol/static/titles.json'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }
}
