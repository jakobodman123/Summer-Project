import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactProfile extends StatelessWidget {
  const ContactProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Creator",
          textAlign: TextAlign.center,
          style: TextStyle(shadows: [
            Shadow(
              blurRadius: 2.0,
              color: Colors.black,
              offset: Offset(2.0, 2.0),
            ),
          ], fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Stack(
          alignment: const Alignment(1, 0.7),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(125.0),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(125.0),
                child: Image.asset(
                  'assets/helpIMG/profile_photo_centered.jpg',
                  width: 250.0,
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Image.asset(
              'assets/helpIMG/mascot.png',
              width: 90.0,
              height: 90.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
        const Text(
          "Jakob Lindecrantz",
          textAlign: TextAlign.center,
          style: TextStyle(shadows: [
            Shadow(
              blurRadius: 2.0,
              color: Colors.black,
              offset: Offset(2.0, 2.0),
            ),
          ], fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
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
          child: const Text(
            'Junior Full-Stack Developer',
            textAlign: TextAlign.center,
            style: TextStyle(
              shadows: [
                Shadow(
                  blurRadius: 2.0,
                  color: Colors.black,
                  offset: Offset(3.0, 3.0),
                ),
              ],
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FaIcon(
              FontAwesomeIcons.locationDot,
              color: Colors.blue,
            ),
            Text(
              ' Stockholm | Sweden',
              textAlign: TextAlign.center,
              style: TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(3.0, 3.0),
                  ),
                ],
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
        /*
        SizedBox(
          width: 250,
          height: 80,
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "About Me",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  Divider(
                    indent: 1,
                    color: Colors.black,
                  ),
                  Text(
                    "25y.o Full-Stack Developer from Sweden with a background in Computer Science & Information Security. Experienced in Flutter Development where this project is made. If you would like to contact me please hit me up on one of the medias provided in this page!",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
        */
      ],
    );
  }
}
