import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:login_app/intro_swiper.dart';
import 'package:login_app/intro_widget.dart';
import 'package:login_app/login_widget.dart';
import 'package:login_app/multiype_form.dart';
import 'package:login_app/step_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('en', ''),
      const Locale('ar', ''),
    ],
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
      // body: MultiTypeForm(),
      body: IntroWidget(),
      // body: IntroSwiper(),
      // body: LoginWidget(),
      //  body: StepWidget(),
    );
  }
}
