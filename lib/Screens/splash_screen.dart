
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interintel_interview_solution/Screens/info_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../constants.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isConnected=false;
  bool isChecking=true;
  late String deviceManufacturer;

  @override
  initState() {
    super.initState();
    getDeviceInfo();

    Timer(Duration(seconds: 3), () {
      setState(() {
       // splashed = true;
      });

      checkInternetConnection();
    });
  }

  checkInternetConnection()async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      setState(() {
        isConnected=true;
      });
      Fluttertoast.showToast(msg: 'Connected to mobile data');
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: InfoScreen(deviceInfo: deviceManufacturer,),
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      setState(() {
        isConnected=true;
      });
      Fluttertoast.showToast(msg: 'Connected to Wifi');
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: InfoScreen(deviceInfo: deviceManufacturer,),
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    }else{
      noInternet();
      setState(() {
        isChecking=false;
      });
      //No connection error message

    }

  }
  getDeviceInfo()async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    setState(() {
      deviceManufacturer=androidInfo.manufacturer;
    });
    print('Running on ${androidInfo.manufacturer}');

  }

  noInternet(){
    return Text("There is a problem with your internet connection",style: TextStyle(color: kLogoutRed),);
  }
  void navigate() {
    if (isConnected) {
      //Navigate to homescreen
    } else{
      noInternet();

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: isChecking ? true : false,
            child: SpinKitChasingDots(
                color: kPrimaryColor,
                duration: Duration(seconds: 1),
                size: 35),
          ),

        ],),
      ),

    );
  }
}
