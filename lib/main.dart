import 'package:brasil_paralelo/view/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Revendedor',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomeSplashScreen(),
    );
  }
}
