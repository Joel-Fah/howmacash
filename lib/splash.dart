import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mon_projet/onboarding.dart';

import 'login.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder:
              (context) => const Onboarding()
              // (context) => isViewed != 0 ? const Onboarding() : const LoginScreen() //To enable view once on onboard screens
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: const Color(0xff2E1C4C),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff3e3a77), Color(0xff2E1C4C)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: Image.asset("assets/images/splash.png")
    );
  }
}
