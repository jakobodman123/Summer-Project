import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'appbarButton.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Color.fromARGB(255, 8, 66, 131),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
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
    );
  }
}
