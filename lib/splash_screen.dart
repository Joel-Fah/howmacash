import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mon_projet/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initSate() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, loginRoute);
  }

  loginRoute() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => LoginScreen()
    ));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff2E1C4C)
            ),
          ),
          Center(
            child: Image.asset(
                "assets/images/icons.png"
            ),
          ),
          Center(
            child: Image.asset(
                "assets/images/logo.png"
            ),
          )
        ],
      ),
    );
  }
}
