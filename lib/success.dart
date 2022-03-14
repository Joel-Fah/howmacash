import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mon_projet/home.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder:
            (context) => const HomePage() // (context) => isViewed != 0 ? const Onboarding() : const LoginScreen() //To enable view once on onboard screens
        )
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "SUCCESS",
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Autodestruct BB',
                    color: Color(0xff2E1C4C),
                ),
                textAlign: TextAlign.center,
              ),
              SvgPicture.asset(
                "assets/images/success.svg"
              ),
              // SizedBox(height: 20,)
              const Text(
                "Your new stock was successfully added to the database.",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff2E1C4C)
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
