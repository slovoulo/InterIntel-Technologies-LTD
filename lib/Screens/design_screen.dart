///Design a card from user information provided in the info screen
///Allow user to share created card

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interintel_interview_solution/constants.dart';

import 'package:permission_handler/permission_handler.dart';

class DesignScreen extends StatefulWidget {
  final String username, email, phoneNumber;
  final bool isFromInfo;
  const DesignScreen(
      {Key? key,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.isFromInfo})
      : super(key: key);

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  double coverheight = 250;
  double profileheight = 100;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  buildCover() {
    return Container(
      color: kPrimaryColor,
      height: coverheight,
    );
  }

  profilePhoto() {
    return CircleAvatar(
      radius: profileheight,
      backgroundColor: kPrimaryColor,
      backgroundImage: AssetImage('assets/images/profile.png'),
    );
  }

  buildTop() {
    final top = coverheight - profileheight;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 120),
          child: buildCover(),
        ),
        Positioned(top: top, child: profilePhoto())
      ],
    );
  }

  Future captureScreen() async {
    final uint8List = await screenshotController.capture();
    String tempPath = (await getTemporaryDirectory()).path;
    String fileName = "myFile";
    if (await Permission.storage.request().isGranted) {
      File file = await File('$tempPath/$fileName.png').create();
      file.writeAsBytesSync(uint8List!);
      await Share.shareFiles([file.path]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColorLighter,
          title: Text("Design"),
          centerTitle: true,
        ),
        body: widget.isFromInfo == true
            ? SingleChildScrollView(
              child: Column(
                  children: [
                    Screenshot(
                      controller: screenshotController,
                      child: Column(
                        children: [
                          buildTop(),
                          Text(
                            widget.username,
                            style: kBoldGreyTextStyle(40),
                          ),
                          Text(
                            widget.email,
                            style: TextStyle(color: kTextColorGrey, fontSize: 18),
                          ),
                          Text(
                            widget.phoneNumber,
                            style: TextStyle(color: kTextColorGrey, fontSize: 18),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15),
                        ],
                      ),
                    ),
                    kTextButton(
                        text: "Share",
                        width: MediaQuery.of(context).size.width * 0.3,
                        onPressed: () {
                          captureScreen();
                        })
                  ],
                ),
            )
            : Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Your profile design will appear here"),
                  SizedBox(height: 25,),
                  kTextButton(text: "Create Now", width: MediaQuery.of(context).size.width*0.4, onPressed: (){
                    Navigator.pop(context);
                  })
                ],
              )));
  }
}
