import 'package:flutter/material.dart';
import 'package:summer_project/accoladesPage.dart';
import 'package:summer_project/main.dart';
import 'package:summer_project/rankedCard.dart';

//https://pbs.twimg.com/media/B8jEndNIYAEavcH.jpg
class MainProfile extends StatelessWidget {
  String iconID = "4884";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: colorLightGrey,
      elevation: 10,
      child: Container(
        //height: 400,
        //width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 90,
                right: 20,
              ), //4884
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: Image.asset('assets/img/profileicon/${iconID}.png'),
              ),

              //Image.asset('assets/img/profileicon/${iconID}.png'),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 5,
                left: 90,
                right: 20,
              ),
              child: Text(
                'Play Easy Champs',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 5,
                left: 90,
                right: 20,
              ),
              child: Text(
                'Summoner lvl: ' + "369",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: RankedCard(
                    "Ranked Solo", "Diamond", "Diamond 4", "34", 41, 39)),
            Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: RankedCard(
                    "Ranked Flex", "Diamond", "Diamond 1", "34", 70, 30)),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: AccoladesPage(),
            ),
          ],
        ),
      ),
    );
  }
}
