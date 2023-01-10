import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesignScreen extends StatefulWidget {
  final String username,email,phoneNumber;
  final bool isFromInfo;
  const DesignScreen({Key? key, required this.username,required this.email, required this.phoneNumber, required this.isFromInfo}) : super(key: key);


  @override
  State<DesignScreen> createState() => _DesignScreenState();
}
build

class _DesignScreenState extends State<DesignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildCover(),);
  }
}
