import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interintel_interview_solution/Screens/design_screen.dart';
import 'package:logging/logging.dart';



import 'Screens/dictionary.dart';
import 'Screens/info_screen.dart';
import 'Screens/splash_screen.dart';
import 'Screens/todos_screen.dart';
import 'constants.dart';
import 'package:get/get.dart';

void main() {
  _setUpLogging();
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<MyDrawerController>(MyDrawerController());
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((log) {
    print('## ${log.time} : ${log.level.name} : ${log.message}');
  });
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
      //home: const SplashScreen(),
      home:  DictionaryScreen(),
    );
  }
}


