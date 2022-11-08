import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:summer_project/main.dart';

List<Slide> slides = [
  Slide(
    centerWidget: Column(
      children: [
        const Card(
          elevation: 10,
          shadowColor: Colors.blue,
          child: SizedBox(
            width: 1200 * 0.7,
            height: 700 * 0.7,
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/img/splash/Fizz_25.jpg"),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 20 * 0.7,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
              ),
              height: 50.0 * 0.7,
              width: 50.0 * 0.7,
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
        const Card(
          elevation: 10 * 0.7,
          shadowColor: Colors.blue,
          child: SizedBox(
            width: 1200 * 0.7,
            height: 700 * 0.7,
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/img/splash/MissFortune_0.jpg"),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 20 * 0.7,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
              ),
              height: 50.0 * 0.7,
              width: 50.0 * 0.7,
            ),
            Text(
              " Loading...",
              style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
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
        const Card(
          elevation: 10,
          shadowColor: Colors.blue,
          child: SizedBox(
            width: 1200 * 0.7,
            height: 700 * 0.7,
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/img/splash/Yuumi_0.jpg"),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 20 * 0.7,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
              ),
              height: 50.0 * 0.7,
              width: 50.0 * 0.7,
            ),
            Text(
              " Loading...",
              style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
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
    const DropdownMenuItem(
        child: Text(
          "BR1",
          style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
        ),
        value: "BR1"),
    const DropdownMenuItem(
        child: Text(
          "EUW1",
          style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
        ),
        value: "EUW1"),
    const DropdownMenuItem(
        child: Text(
          "EUN1",
          style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
        ),
        value: "EUN1"),
    const DropdownMenuItem(
        child: Text(
          "LA1",
          style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
        ),
        value: "LA1"),
    const DropdownMenuItem(
        child: Text(
          "LA2",
          style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
        ),
        value: "LA2"),
    const DropdownMenuItem(
        child: Text(
          "NA1",
          style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
        ),
        value: "NA1"),
    const DropdownMenuItem(
        child: Text(
          "OC1",
          style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
        ),
        value: "OC1"),
    const DropdownMenuItem(
        child: Text(
          "RU",
          style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
        ),
        value: "RU"),
    const DropdownMenuItem(
        child: Text(
          "TR1",
          style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
        ),
        value: "TR1"),
    const DropdownMenuItem(
        child: Text(
          "JP1",
          style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
        ),
        value: "JP1"),
    const DropdownMenuItem(
        child: Text(
          "KR",
          style: TextStyle(color: Colors.white, fontSize: 22 * 0.7),
        ),
        value: "KR"),
  ];
  return menuItems;
}
