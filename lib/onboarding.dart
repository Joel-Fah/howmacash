import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mon_projet/content_onboarding.dart';
import 'package:mon_projet/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC0BDC6),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SvgPicture.asset(
                          contents[i].image,
                          //Takes corresponding image from content_onboarding.dart
                          height: 400,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          // "Have your customers’ order information saved and organised.",
                          contents[i].title,
                          //Takes corresponding title from content_onboarding.dart
                          style: const TextStyle(
                              color: Color(0xff2E1C4C),
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 20.0),
                              child: Text(
                                contents[i].description,
                                //Takes corresponding description from content_onboarding.dart
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w200),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                contents.length, (index) => buildDot(index, context)),
          ),
          Container(
            margin: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff6C63FF),
            ),
            height: 55,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                }
                _controller?.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn
                );
              },
              child: Text(
                currentIndex == contents.length - 1 ? "Continue" : "Next",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? const Color(0xff2E1C4C)
            : const Color(0xff6C63FF),
      ),
    );
  }
}
