import 'dart:collection';

import 'package:flutter/material.dart';

import '../main.dart';

class SupportMethods {
  List<dynamic> getMapString(List<String>? list) {
    var map = Map();
    list!.forEach((e) => map.update(e, (x) => x + 1, ifAbsent: () => 1));

    var sortedKeys = map.keys.toList(growable: false)
      ..sort((k1, k2) => map[k2].compareTo(map[k1]));
    LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => map[k]);
    var sortedList = sortedMap.keys.toList();
    return sortedList;
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 20,
          backgroundColor: colorDarkGrey,
          titleTextStyle: const TextStyle(color: Colors.red, fontSize: 18),
          contentTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
          title: Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
