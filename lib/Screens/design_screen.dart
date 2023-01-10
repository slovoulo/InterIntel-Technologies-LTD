import 'dart:io';
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interintel_interview_solution/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class DesignScreen extends StatefulWidget {
  // final String username,email,phoneNumber;
  // final bool isFromInfo;
  // const DesignScreen({Key? key, required this.username,required this.email, required this.phoneNumber, required this.isFromInfo}) : super(key: key);

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  double coverheight = 300;
  double profileheight = 100;
  ScreenshotController screenshotController = ScreenshotController();

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

  // Future screenToPdf(
  //   String fileName,
  // ) async {
  //   try {
  //     pw.Document pdf = pw.Document();
  //     final screenShot = await screenshotController.capture();
  //     pdf.addPage(
  //       pw.Page(
  //         pageFormat: PdfPageFormat.a4,
  //         build: (pw.Context context) {
  //           return pw.Expanded(
  //             child:
  //                 pw.Image(pw.MemoryImage(screenShot!), fit: pw.BoxFit.contain),
  //           );
  //         },
  //       ),
  //     );
  //     String path = (await getTemporaryDirectory()).path;
  //
  //     if (await Permission.storage.request().isGranted) {
  //      // File pdfFile = await File('$path/$fileName.pdf').create();
  //       final pdfFile = File("example.pdf");
  //
  //       await pdfFile.writeAsBytes(await pdf.save()!);
  //      // await Share.shareFiles([pdfFile.path]);
  //       print("pdf exporteds ss");
  //     }
  //
  //   } catch (e) {
  //     print("pdf error is $e");
  //   }
  // }

  // Future getPdf() async {
  //   final screenShot = await screenshotController.capture();
  //   pw.Document pdf = pw.Document();
  //   pdf.addPage(
  //     pw.Page(
  //       pageFormat: PdfPageFormat.a4,
  //       build: (context) {
  //         return pw.Expanded(
  //             child: pw.Image(pw.MemoryImage(screenShot!), fit: pw.BoxFit.contain)
  //         );
  //       },
  //     ),
  //   );
  //   File pdfFile = File('Your path + File name');
  //   pdfFile.writeAsBytesSync(await pdf.save());
  // }

  saveToGallery(File image) async {
     final result = await ImageGallerySaver.saveImage(image.readAsBytesSync(),quality: 80);
    print("File Saved to Gallery");
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screenshot(
        controller: screenshotController,
        child: Column(
          children: [
            Column(
              children: [
                buildTop(),
                Text(
                  "Username",
                  style: kBoldBlackTextStyle(40),
                ),
                Text(
                  "username@email.com",
                  style: TextStyle(color: kTextColorGrey),
                ),
                Text(
                  "0708393939",
                  style: TextStyle(color: kTextColorGrey),
                ),
                SizedBox(
                  height: 20,
                ),
                
              ],
            ),
            kTextButton(
                text: "Export PDF",
                width: MediaQuery.of(context).size.width * 0.3,
                onPressed: () {

                })
          ],
        ),
      ),
    );
  }
}
