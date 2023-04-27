import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:summer_project/util/gradient_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactCard extends StatelessWidget {
  final String title;
  final String description;
  final FaIcon icon;
  final String url;

  const ContactCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 20,
      color: Colors.white,
      child: SizedBox(
        height: 220 * 0.7,
        width: 460 * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                icon,
              ],
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse(
                    'https://github.com/jakobodman123/Summer-Project'));
              },
              child: const GradientButton(
                text: "Visit",
                width: 100,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
