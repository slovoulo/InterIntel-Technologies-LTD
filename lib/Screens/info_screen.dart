import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:showcaseview/showcaseview.dart';



import '../constants.dart';
import 'design_screen.dart';
import 'info_body.dart';


class InfoScreen extends GetView<MyDrawerController> {
  static String routeName = "/home";

  final String deviceInfo;
  const InfoScreen({Key? key, required this.deviceInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: MenuScreen(deviceInfo:deviceInfo),
        mainScreen: MainScreen(controller: controller),
        androidCloseOnBackTap: true,
        borderRadius: 24.0,
        showShadow: true,
        mainScreenTapClose: true,
        angle: -10.0,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        moveMenuScreen: false,
        mainScreenScale: 0.2,
        style: DrawerStyle.defaultStyle,
        shadowLayer1Color: kPrimaryColorLight,
        shadowLayer2Color: kPrimaryColor,
        menuBackgroundColor: kPrimaryColorLighter,
      ),
    );
  }
}

class MainScreen extends GetView<MyDrawerController> {
  const MainScreen({
    Key? key,
    required this.controller,

  }) : super(key: key);

  final MyDrawerController controller;


  @override
  Widget build(BuildContext context) {
    //final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColorLighter,
        title: Row(
          children: [
            GestureDetector(
              onTap: controller.toggleDrawer,
              child: Icon(Icons.menu),
            ),
            Spacer(),
            Text(
              'Info',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kTextColorBlack),
            ),
            Spacer(),
            //NotificationView()
          ],
        ),
        iconTheme: IconThemeData(color: kTextColorBlack),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: InfoBody(),
    );
  }
}


class MenuScreen extends GetView<MyDrawerController> {


  final String deviceInfo;
  const MenuScreen({Key? key, required this.deviceInfo}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return buildMenu(context);
  }

  Widget buildMenu(context) {
  //  final profileProvider = Provider.of<ProfileProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height,
      color: kPrimaryColorLight,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // profileProvider.previewImage(
                //     context: context,
                //     radius: 22.0,
                //     avatarRadius: 22.0,
                //     fontSize: 12.0),
                SizedBox(height: 16.0),
                Text(
                  "Hello there $deviceInfo user.",
                  style: const TextStyle(fontSize: 15, color: kWhiteColor,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),

          ListTile(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: DesignScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            leading: Icon(Icons.design_services, size: 20.0,color: kPrimaryLightGrey,),
            title:  Text("Design", style: kWhiteTextStyle(12)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            dense: true,
            enabled: false,
          ),
          ListTile(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: DesignScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            leading: Icon(Icons.feed_outlined, size: 20.0,color: kPrimaryLightGrey),
            title:  Text("Response", style: kWhiteTextStyle(12)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            dense: true,
            enabled: false,
          ),
          ListTile(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: DesignScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            leading: Icon(Icons.collections, size: 20.0,color: kPrimaryLightGrey),
            title:  Text("Dictionary", style: kWhiteTextStyle(12)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            dense: true,
            enabled: false,
          ),

          SizedBox(height: 30),

        ],
      ),
    );
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();


  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
  }
}