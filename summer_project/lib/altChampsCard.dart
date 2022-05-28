import 'package:flutter/material.dart';
import 'package:summer_project/altChampsWidget.dart';
import 'package:summer_project/main.dart';

class AltChampsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: colorLightGrey,
      elevation: 10,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 40,
              left: 80,
            ),
            child: Text(
              "Alternative Champs",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 50),
            child: AltChampsWidget("MissFortune", 173, 52, "10.2/4.5/12.7"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: AltChampsWidget("Janna", 42, 61, "10.2/4.5/12.7"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: AltChampsWidget("Nautilus", 23, 41, "10.2/4.5/12.7"),
          ),
        ],
      ),
    );
  }
}
