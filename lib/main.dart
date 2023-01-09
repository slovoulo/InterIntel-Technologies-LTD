import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/splash_screen.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: kWhiteColor,
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        //fontFamily: "Poppins",
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: kPrimaryColor),
      ),
      home: const SplashScreen(),
    );
  }
}


