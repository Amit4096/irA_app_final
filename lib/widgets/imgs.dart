import 'package:flutter/material.dart';

class ScrollImages extends StatefulWidget {
  @override
  _ScrollImagesState createState() => _ScrollImagesState();
}

class _ScrollImagesState extends State<ScrollImages> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Column(
        children: [Flexible(child: Image.asset('images/cooked_food.png'))]);
  }
}
