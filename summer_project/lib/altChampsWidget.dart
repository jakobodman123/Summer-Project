import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:summer_project/kdaWidget.dart';
import 'package:summer_project/main.dart';

class AltChampsWidget extends StatelessWidget {
  final String champName;
  final int gamesPlayed;
  final int winrate;
  final String kda;

  const AltChampsWidget(
      this.champName, this.gamesPlayed, this.winrate, this.kda);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 10,
      color: colorLightGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Container(
            height: 300.0,
            width: 400.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    //alignment: FractionalOffset.topCenter,
                    image: AssetImage("assets/img/splash/${champName}_0.jpg"))),
          ),
          Column(
            children: [
              KdaWidget(
                  kills: 7000, deaths: 5000, assists: 12000, gamesPlayed: 1000),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 5.0,
                          percent: winrate.toDouble() / 100,
                          center: GlowText(
                            winrate.toString(),
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          progressColor: Colors.green,
                        ),
                        const Text(
                          "Winrate",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      //right: 40,
                      top: 5,
                    ),
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 5.0,
                          percent: 1,
                          center: GlowText(
                            gamesPlayed.toString(),
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          progressColor: Colors.blue,
                        ),
                        const Text(
                          "Games",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
