import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:summer_project/util/gradient_button.dart';

class ErrorPage extends StatelessWidget {
  final String summonerName;
  final Size screenSize;
  const ErrorPage(
      {Key? key, required this.summonerName, required this.screenSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/helpIMG/highResRuinedMF.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Colors.green,
                  Color.fromARGB(255, 8, 66, 131),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                tileMode: TileMode.mirror,
              ).createShader(bounds),
              child: Text(
                'Oops!',
                textAlign: TextAlign.center,
                style: GoogleFonts.creepster(
                  textStyle: const TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.black,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                    fontSize: 140,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 450,
              child: Text(
                "404-Page-Not-Found",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28 * 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 2.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 450,
              child: Text(
                "It looks like the Summoner \"" +
                    summonerName +
                    "\" was not found! Please check your spelling and try again!",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28 * 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  shadows: [
                    Shadow(
                      blurRadius: 2.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
              child: const GradientButton(
                height: 40,
                text: "Home",
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
