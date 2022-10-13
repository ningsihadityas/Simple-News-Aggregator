import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:qlipper/form.dart';
import 'package:qlipper/homepage/homepage.dart';
import 'package:qlipper/login/login_page.dart';
import 'package:qlipper/register/register.dart';
import 'package:qlipper/views/home.dart';
import 'homepage/homepage_login.dart';

void main() {
  runApp(
      //MidtermHome()

      Qlipper());

  // runApp(ChangeNotifierProvider(
  //     create: (context) => BookmarkController(), child: Qlipper()));
}

class Qlipper extends StatefulWidget {
  @override
  _QlipperState createState() => _QlipperState();
}

class _QlipperState extends State<Qlipper> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qlipper',
        theme: ThemeData(primaryColor: Colors.grey[50]),
        home: Home());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
