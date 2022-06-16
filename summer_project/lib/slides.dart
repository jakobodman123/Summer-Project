import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:summer_project/main.dart';

List<Slide> slides = [
  Slide(
    centerWidget: Column(
      children: [
        Card(
          elevation: 10,
          shadowColor: Colors.blue,
          child: Container(
            width: 1200,
            height: 700,
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/img/splash/Fizz_0.jpg"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
              ),
              height: 50.0,
              width: 50.0,
            ),
            Text(
              " Loading...",
              style: TextStyle(color: Colors.white, fontSize: 22),
            )
          ],
        ),
      ],
    ),
    backgroundImage: "assets/img/splash/Fizz_0.jpg",
    title: "Did You Know?",
    description:
        "Blitzcrank can use his Power First(E) to knock fizz out of his Playful/Trickster(E)...",
    backgroundColor: Colors.black,
  ),
  Slide(
    centerWidget: Column(
      children: [
        Card(
          elevation: 10,
          shadowColor: Colors.blue,
          child: Container(
            width: 1200,
            height: 700,
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/img/splash/MissFortune_0.jpg"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
              ),
              height: 50.0,
              width: 50.0,
            ),
            Text(
              " Loading...",
              style: TextStyle(color: Colors.white, fontSize: 22),
            )
          ],
        ),
      ],
    ),
    backgroundImage: "assets/img/splash/MissFortune_0.jpg",
    title: "Did You Know?",
    description: "Focus on the text you perv!",
    backgroundColor: colorDarkGrey,
  ),
  Slide(
    centerWidget: Column(
      children: [
        Card(
          elevation: 10,
          shadowColor: Colors.blue,
          child: Container(
            width: 1200,
            height: 700,
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/img/splash/Yuumi_0.jpg"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
              ),
              height: 50.0,
              width: 50.0,
            ),
            Text(
              " Loading...",
              style: TextStyle(color: Colors.white, fontSize: 22),
            )
          ],
        ),
      ],
    ),
    backgroundImage: "assets/img/splash/Yuumi_0.jpg",
    title: "Did You Know?",
    description:
        "My grandma reached challenger rank 1 playing yuumi blindfolded",
    backgroundColor: colorDarkGrey,
  ),
];

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        child: Text(
          "BR1",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        value: "BR1"),
    DropdownMenuItem(
        child: Text(
          "EUW1",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        value: "EUW1"),
    DropdownMenuItem(
        child: Text(
          "EUN1",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        value: "EUN1"),
    DropdownMenuItem(
        child: Text(
          "LA1",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        value: "LA1"),
    DropdownMenuItem(
        child: Text(
          "LA2",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        value: "LA2"),
    DropdownMenuItem(
        child: Text(
          "NA1",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        value: "NA1"),
    DropdownMenuItem(
        child: Text(
          "OC1",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        value: "OC1"),
    DropdownMenuItem(
        child: Text(
          "RU",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        value: "RU"),
    DropdownMenuItem(
        child: Text(
          "TR1",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        value: "TR1"),
    DropdownMenuItem(
        child: Text(
          "JP1",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        value: "JP1"),
    DropdownMenuItem(
        child: Text(
          "KR",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        value: "KR"),
  ];
  return menuItems;
}
