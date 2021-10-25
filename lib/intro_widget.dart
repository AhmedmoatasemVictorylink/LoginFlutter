import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_app/login_widget.dart';
import 'package:login_app/step_two_widget.dart';
import 'package:login_app/step_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import './dots.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({ Key? key }) : super(key: key);

  @override
  _IntroWidgetState createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {

  final _controller = PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

   final List<Widget> _pages = <Widget>[
    Step2Widget(),
    StepWidget(),
  ];

   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconTheme(
        data: IconThemeData(color: _kArrowColor),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                color: Colors.grey[800]?.withOpacity(0.5),
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: DotsIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}