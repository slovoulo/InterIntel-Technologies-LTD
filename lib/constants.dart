import 'dart:ui';

import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFF17344d);
Color kPrimaryColorLight = Color(0xFF17344d).withOpacity(0.25);
Color kPrimaryColorLighter = Color(0xFF17344d).withOpacity(0.5);

const kWhiteColor = Colors.white;

const kPrimaryLightGrey = Color(0xFFD4D4D4);

const kTextColorBlack = Color(0xFF000000);
const kTextColorGrey = Color(0xFF9E9E9E);

const kLogoutRed = Color(0xFF880808);

//REUSABLE TEXT STYLE BLUEPRINT
TextStyle kWhiteTextStyle(
  double fontSize,
) {
  return TextStyle(
      color: kWhiteColor, fontSize: fontSize, fontWeight: FontWeight.w600);
}

TextStyle kBoldBlackTextStyle(
  double fontSize,
) {
  return TextStyle(
      color: kTextColorBlack, fontSize: fontSize, fontWeight: FontWeight.bold);
}

TextStyle kBoldGreyTextStyle(
  double fontSize,
) {
  return TextStyle(
      color: kTextColorGrey, fontSize: fontSize, fontWeight: FontWeight.bold);
}

//REUSABLE BUTTON BLUEPRINT
kTextButton(
    {required String text,
    required double width,
    required Function() onPressed}) {
  return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(
              50,
            )),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 20, color: kWhiteColor, fontWeight: FontWeight.w700),
        )),
      ));
}
