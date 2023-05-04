import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:summer_project/pages/about_page.dart';
import 'package:summer_project/pages/contact_page.dart';
import 'package:summer_project/pages/searchPage.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  bool isCollapsed = true;

  void toggleIsCollapsed() {
    isCollapsed = !isCollapsed;
  }

  @override
  Widget build(BuildContext context) {
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    //final provider = Provider.of<NavigationProvider>(context);

    final itemsFirst = [
      const DrawerItem(title: 'Home Page', icon: Icons.home),
      const DrawerItem(title: 'About', icon: Icons.info),
      const DrawerItem(title: 'Contact', icon: Icons.email),
    ];

    return SizedBox(
      width: isCollapsed ? 80 : null,
      child: Drawer(
        child: Container(
          color: const Color(0xFF1a2f45),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24).add(safeArea),
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Color.fromARGB(255, 8, 66, 131),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: buildHeader(),
              ),
              const SizedBox(height: 24),
              buildList(
                items: itemsFirst,
              ),
              const SizedBox(height: 24),
              const Divider(color: Colors.white70),
              const SizedBox(height: 24),
              const Spacer(),
              buildCollapseIcon(
                context,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList({
    required List<DrawerItem> items,
    int indexOffset = 0,
  }) =>
      ListView.separated(
        padding: isCollapsed ? EdgeInsets.zero : padding,
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = items[index];

          return buildMenuItem(
            text: item.title,
            icon: item.icon,
            onClicked: () => selectItem(context, indexOffset + index),
          );
        },
      );

  void selectItem(BuildContext context, int index) {
    navigateTo(page) => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));

    Navigator.of(context).pop();

    switch (index) {
      case 0:
        navigateTo(const SearchPage());
        break;
      case 1:
        navigateTo(const AboutPage());
        break;
      case 2:
        navigateTo(const ContactPage());
        break;
    }
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    final leading = Icon(icon, color: color);

    return Material(
      color: Colors.transparent,
      child: isCollapsed
          ? ListTile(
              title: leading,
              onTap: onClicked,
            )
          : ListTile(
              leading: leading,
              title: Text(text,
                  style: const TextStyle(color: color, fontSize: 16)),
              onTap: onClicked,
            ),
    );
  }

  Widget buildCollapseIcon(
    BuildContext context,
  ) {
    const double size = 52;
    final icon = isCollapsed ? Icons.arrow_back_ios : Icons.arrow_forward_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : const EdgeInsets.only(right: 16);
    double width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: SizedBox(
            width: width,
            height: size,
            child: Icon(icon, color: Colors.white),
          ),
          onTap: () {
            setState(() {
              toggleIsCollapsed();
            });
          },
        ),
      ),
    );
  }

  Widget buildHeader() => isCollapsed
      ? Image.asset(
          "assets/helpIMG/mascot.png",
          fit: BoxFit.cover,
        )
      : Row(
          children: [
            const SizedBox(width: 24),
            Image.asset(
              "assets/helpIMG/mascot.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
          ],
        );
}

class DrawerItem {
  final String title;
  final IconData icon;

  const DrawerItem({
    required this.title,
    required this.icon,
  });
}
