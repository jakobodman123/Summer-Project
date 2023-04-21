import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../about_page.dart';
import 'appbarButton.dart';

class CustomAppbar {
  AppBar customAppbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      //add title widget
      actions: <Widget>[
        Row(
          children: [
            CustomAppbarButton(
              text: "Other Projects",
              onPressed: () {
                launchUrl(Uri.parse('https://github.com/jakobodman123'));
              },
            ),
            CustomAppbarButton(
              text: "About",
              onPressed: () {
                Navigator.pushNamed(context, "/about");
              },
            ),
            CustomAppbarButton(
              text: "Contact",
              onPressed: () {
                launchUrl(Uri.parse('https://github.com/jakobodman123'));
              },
            ),
          ],
        ),
      ],
    );
  }
}
