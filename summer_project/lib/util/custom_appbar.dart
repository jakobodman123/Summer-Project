import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summer_project/util/title_logo.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/about_page.dart';
import 'appbarButton.dart';

class CustomAppbar extends AppBar {
  AppBar customAppbar(BuildContext context, bool isSearchPage) {
    return AppBar(
      title: TitleLogo(),
      elevation: 0,
      automaticallyImplyLeading: isSearchPage ? false : true,
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
                Navigator.pushNamed(context, "/contact");
              },
            ),
          ],
        ),
      ],
    );
  }
}
