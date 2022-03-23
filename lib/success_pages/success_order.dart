import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mon_projet/home.dart';

import '../order/order_added.dart';

class SuccessOrderPage extends StatefulWidget {
  const SuccessOrderPage({Key? key}) : super(key: key);

  @override
  _SuccessOrderPageState createState() => _SuccessOrderPageState();
}

class _SuccessOrderPageState extends State<SuccessOrderPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder:
            (context) => const OrderPage() // (context) => isViewed != 0 ? const Onboarding() : const LoginScreen() //To enable view once on onboard screens
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
                    letterSpacing: 10.0
                ),
                textAlign: TextAlign.center,
              ),
              SvgPicture.asset(
                  "assets/images/order.svg"
              ),
              // SizedBox(height: 20,)
              const Text(
                "Your new order was successfully added to the database.",
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
