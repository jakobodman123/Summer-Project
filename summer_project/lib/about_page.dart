import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:summer_project/util/custom_appbar.dart';
import 'package:summer_project/util/gradient_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar().customAppbar(context),
      body: Stack(
        children: <Widget>[
          Container(
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
                scrollDirection: Axis.vertical,
                child: FadeTransition(
                  opacity: _animation,
                  child: ResponsiveRowColumn(
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    rowPadding: const EdgeInsets.only(top: 100),
                    columnPadding: const EdgeInsets.only(
                        top: 100, left: 10, right: 10, bottom: 10),
                    layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                        ? ResponsiveRowColumnType.COLUMN
                        : ResponsiveRowColumnType.ROW,
                    children: [
                      const ResponsiveRowColumnItem(
                        child: SizedBox(),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
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
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Color.fromARGB(255, 8, 66, 131),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  tileMode: TileMode.mirror,
                                ).createShader(bounds),
                                child: const Text(
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
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 30,
                                bottom: 30,
                              ),
                              child: SizedBox(
                                width: 600,
                                child: Text(
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
                            ),
                            Row(
                              children: [
                                const GradientButton(
                                  text: "Try it out",
                                  width: 140,
                                  height: 50,
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                InkResponse(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        'https://github.com/jakobodman123/Summer-Project'));
                                  },
                                  child: Container(
                                    width: 140,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Colors.blue,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Github',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: SizedBox(
                            height: 500,
                            width: 400,
                            child: Image.asset(
                              "assets/helpIMG/mascot_upscaled.jpg",
                              fit: BoxFit.cover,
                              scale: 2,
                            ),
                          )),
                      const ResponsiveRowColumnItem(
                        child: SizedBox(),
                      ),
                      const ResponsiveRowColumnItem(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
