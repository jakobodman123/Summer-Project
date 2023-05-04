import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: Image.asset(
            "assets/helpIMG/icon-192.png",
            fit: BoxFit.contain,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "PLAYEASYCHAMPS.COM",
              textAlign: TextAlign.start,
              style: GoogleFonts.blackOpsOne(
                textStyle: const TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Text(
              "Improve Today!",
              textAlign: TextAlign.start,
              style: GoogleFonts.blackOpsOne(
                textStyle: const TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
