import 'package:flutter/material.dart';
import 'package:login_app/intro_swiper.dart';
import 'package:login_app/intro_widget.dart';
import 'package:login_app/login_widget.dart';
import 'package:login_app/step_widget.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.grey,
      colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.amber,
            primarySwatch: Colors.grey,
            ),
    ),
    home: MyApp(),
  ));
}
 
class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<MyApp> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroWidget(),
     // body: IntroSwiper(),
      // body: LoginWidget(),
      //  body: StepWidget(),
      );
  }
}