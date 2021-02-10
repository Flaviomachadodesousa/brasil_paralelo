import 'package:brasil_paralelo/view/Login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class HomeSplashScreen extends StatefulWidget {
  @override
  _HomeSplashScreenState createState() => _HomeSplashScreenState();
}

class _HomeSplashScreenState extends State<HomeSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0x18802b), Color(0x18802b)],
        ),
        navigateAfterSeconds: LoginUser(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo.png"),
            fit: BoxFit.contain,
          ),
        ),
      ),
    ],
  );
}
