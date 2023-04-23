import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:summer_project/searchPage.dart';

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 20,
      backgroundColor: colorDarkGrey,
      titleTextStyle: const TextStyle(color: Colors.blue, fontSize: 18),
      contentTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
      title: const Text('Play Easy Champions ALPHA'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text(
                'This is a prototype application in development/testing phase!\n'),
            Text(
                'To use, enter a player name such as "ritzler" in the search field ' +
                    "to test the application!\n"),
            Text("Note: Only EUW Players are currently supported!")
          ],
        ),
      ),
      actions: <Widget>[
        Center(
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            child: const Text('Got it!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
