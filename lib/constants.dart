import 'dart:ui';

import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFF17344d);
Color kPrimaryColorLight = Color(0xFF17344d).withOpacity(0.25);
Color kPrimaryColorLighter = Color(0xFF17344d).withOpacity(0.5);

Color kWebviewColor = Color(0xFF3B6CE9).withOpacity(0.4);

const kWhiteColor = Colors.white;

const kPrimaryBlueColor = Color(0xFF17344d);
const kPrimaryLightGrey = Color(0xFFD4D4D4);

const kTextColorBlack = Color(0xFF000000);
const kTextColorGrey = Color(0xFF9E9E9E);
const kTextColorNavy = Color(0xFF003665);

const kNashPink = Color(0xFFFC3C80);
const kNashPurple = Color(0xFF5927FF);

const kGradientLighterBlue = Color(0xFFD5E6F8);
const kGradientLightBlue = Color(0xFF98C4F3);

const kSuccessGreen = Color(0xFF4CAF50);
const kLogoutRed = Color(0xFFFF7171);
const kPendingOrange = Color(0xFFFF9800);

//showcaseview keys
final GlobalKey zero = GlobalKey();
final GlobalKey one = GlobalKey();
final GlobalKey two = GlobalKey();
final GlobalKey three = GlobalKey();
final GlobalKey four = GlobalKey();
final GlobalKey five = GlobalKey();
final List<GlobalKey> showcaseKeys = [zero, one, two, three, four, five];

//REUSABLE TEXT STYLE BLUEPRINT
TextStyle kWhiteTextStyle(
  double fontSize,
) {
  return TextStyle(
      color: kWhiteColor, fontSize: fontSize, fontWeight: FontWeight.w600);
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
