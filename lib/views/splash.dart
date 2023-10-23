import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chessmastergame/Auth/login.dart';
import 'package:chessmastergame/Dashboard/dashboard.dart';
import 'package:chessmastergame/views/main_menu_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final colorizeColors = [
    Colors.black,
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  final colorizeTextStyle = const TextStyle(
    fontSize: 40.0,
  );
  @override
  void initState() {
    super.initState();
    Aman();
    // Timer(const Duration(seconds: 5), () => Get.off(const MainMenuView()));

  }
  Aman() async {
    // final prefs = await SharedPreferences.getInstance();
    // final userid=prefs.getString("userId")??"0";
    // userid!="0"?
    // Timer(Duration(seconds: 3), () {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>bottom()));
    // }):
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>login()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // color: const Color(0xFF1F2224),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/SplashLogo.png"),
                // Lottie.asset("assets/splash.json"),
                // const SizedBox(
                //   height: 60,
                // ),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'RealmoneyChess',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                  ],
                  isRepeatingAnimation: true,
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
