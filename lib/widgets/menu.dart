import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:fllutter_firabase_form/screens/contact.dart';
import 'package:fllutter_firabase_form/screens/login.dart';
import 'package:fllutter_firabase_form/screens/about.dart';
import 'package:fllutter_firabase_form/screens/donate.dart';

class MenuButton extends StatelessWidget {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  Icon _chooseIcon(int i) {
    Icon icon = i == 0
        ? Icon(Icons.cabin, color: Colors.white)
        : i == 1
            ? Icon(Icons.person, color: Colors.white)
            : i == 2
                ? Icon(Icons.monetization_on, color: Colors.white)
                : i == 3
                    ? Icon(Icons.chat_rounded, color: Colors.white)
                    : Icon(Icons.info_outline_rounded, color: Colors.white);

    return icon;
  }

  Color _chooseColor(int i) {
    Color color = i == 0
        ? Colors.red
        : i == 1
            ? Colors.blue
            : i == 2
                ? Colors.green
                : i == 3
                    ? Colors.pink
                    : Colors.deepOrange;
    return color;
  }

  choosePage(int i, BuildContext context) {
    // ignore: unnecessary_statements
    return i == 0
        ? () {
            print('You Pressed $i');
          }
        : i == 1
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
            : i == 2
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DonatePage()),
                    );
                  }
                : i == 3
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactPage()),
                        );
                      }
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutPage()),
                        );
                      };
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Builder(
      builder: (context) => FabCircularMenu(
        key: fabKey,
        alignment: Alignment.bottomRight,
        ringColor: Colors.deepPurple.withAlpha(1000),
        ringDiameter: 430,
        ringWidth: 80.0,
        fabSize: 64.0,
        fabElevation: 8.0,
        fabIconBorder: CircleBorder(),
        fabColor: Colors.deepPurple,
        fabOpenIcon: Icon(Icons.apps_rounded, color: Colors.white),
        fabCloseIcon: Icon(Icons.cancel_outlined, color: Colors.white),
        fabMargin: const EdgeInsets.all(16.0),
        animationDuration: const Duration(milliseconds: 800),
        animationCurve: Curves.easeInOutCirc,
        children: <Widget>[
          for (int i = 1; i < 5; i++)
            _CirCularButton(
              width: 70,
              height: 70,
              color: _chooseColor(i),
              icon: _chooseIcon(i),
              onClick: choosePage(i, context),
            )
        ],
      ),
    );
  }
}

class _CirCularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final VoidCallback onClick;
  const _CirCularButton({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(width)),
      width: width,
      height: height,
      child: IconButton(
        icon: icon,
        enableFeedback: true,
        onPressed: onClick,
      ),
    );
  }
}
