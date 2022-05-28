import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:summer_project/main.dart';

class AccoladesPage extends StatelessWidget {
  List items = getDummyList();

  static List getDummyList() {
    List list = List.generate(12, (i) {
      return "Account Accolade ${i + 1}";
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: colorGrey,
        child: Container(
          height: 300,
          width: 460,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: GlowButton(
                        width: 140,
                        onPressed: () {},
                        color: Colors.blue,
                        child: Text(items[0]),
                      ),
                    ),
                    GlowButton(
                      width: 140,
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text(items[1]),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: GlowButton(
                        width: 140,
                        onPressed: () {},
                        color: Colors.blue,
                        child: Text(items[2]),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: GlowButton(
                      width: 140,
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text(items[0]),
                    ),
                  ),
                  GlowButton(
                    width: 140,
                    onPressed: () {},
                    color: Colors.blue,
                    child: Text(items[1]),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: GlowButton(
                      width: 140,
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text(items[2]),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: GlowButton(
                      width: 140,
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text(items[0]),
                    ),
                  ),
                  GlowButton(
                    width: 140,
                    onPressed: () {},
                    color: Colors.blue,
                    child: Text(items[1]),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: GlowButton(
                      width: 140,
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text(items[2]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: GlowButton(
                        width: 140,
                        onPressed: () {},
                        color: Colors.blue,
                        child: Text(items[0]),
                      ),
                    ),
                    GlowButton(
                      width: 140,
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text(items[1]),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: GlowButton(
                        width: 140,
                        onPressed: () {},
                        color: Colors.blue,
                        child: Text(items[2]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
