
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  @override
  initState() {
    super.initState();

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
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      setState(() {
        isConnected=true;
      });
      Fluttertoast.showToast(msg: 'Connected to Wifi');
    }else{
      noInternet();
      setState(() {
        isChecking=false;
      });
      //No connection error message

    }

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
