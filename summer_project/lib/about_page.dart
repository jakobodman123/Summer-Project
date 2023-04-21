import 'package:flutter/material.dart';
import 'package:summer_project/util/custom_appbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar().customAppbar(context),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/helpIMG/highResRuinedMF.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 150, right: 200),
                        child: Text(
                          "This is Play Easy Champions",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, left: 150, right: 200),
                        child: Text(
                          "A Riot API webscrapper",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 150, right: 200),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: const Text(
                                "Play Easy Champion uses the riot api to fetch game data from summoners' recent ranked matches and calculates the performance of these games. The calculation takes the summoners 4 most played champions and displays relevant stats such as kills/deaths/assists. The stats are gathered from the matches displayed in the Match History section in the middle of the screen, which shows more in depth data of each individual match. There is also a Summoner section where account data is displayed, such as ranked data, summoner icon etc. To increase the amount of games calculated you can click the “load more matches” button under match history to increase the sample size. This is a limitation to avoid initial slow load on many matches having to be loaded at the same time. Overall I hope you enjoy the app and if there are any issues you can reach out to me from the contact section.",
                                style: TextStyle(shadows: [
                                  Shadow(
                                    blurRadius: 2.0,
                                    color: Colors.black,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ], fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(),
                  SizedBox(
                    child: Image.asset(
                      "assets/helpIMG/mascot_upscaled.jpg",
                      fit: BoxFit.cover,
                      scale: 2,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
