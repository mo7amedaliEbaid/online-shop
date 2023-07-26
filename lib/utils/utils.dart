import 'package:flutter/material.dart';

import 'colors.dart';

const kTitleStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
    color: Colors.white);

const kNormalStyle = TextStyle(
    fontSize: 15,
    height: 1.3,
    fontWeight: FontWeight.w600,
    color: Colors.black);

List<String> assetspics=[
  "assets/0.jpeg",
  "assets/1.jpeg",
  "assets/2.jpeg",
  "assets/3.jpeg",
  "assets/4.jpeg",
  "assets/5.jpeg",
  "assets/6.jpeg",
  "assets/7.jpeg",
];
List<Widget> buildIndicators() {
  List<Widget> list = [];
  for (int i = 0; i < 4; i++) {
    list.add(i == 0 ? indicator(true) : indicator(false));
  }
  return list;
}

Widget indicator(bool isActive) {
  return AnimatedContainer(
    margin: const EdgeInsets.symmetric(horizontal: 4.0),
    duration: const Duration(milliseconds: 150),
    height: 8.0,
    width: isActive ? 15.0 : 8.0,
    decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(30)),
  );
}
