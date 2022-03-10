import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mon_projet/home.dart';
import 'package:mon_projet/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed; //To enable view once on onboard screens

Future<void> main() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        // statusBarColor: Colors.transparent,
        systemNavigationBarColor: Color(0xff2E1C4C)
      )
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance(); //To enable view once on onboard screens
  isViewed = prefs.getInt('onBoard'); //To enable view once on onboard screens
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme
        ),
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      // home: const SplashScreen(),
      // home: isViewed != 0 ? const Onboarding() : const LoginScreen()
    );
  }
}
