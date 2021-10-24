import 'package:flutter/material.dart';
import 'package:login_app/login_widget.dart';
import 'package:login_app/step_widget.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({ Key? key }) : super(key: key);

  @override
  _IntroWidgetState createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {

  PageController _controller = PageController(
    initialPage: 0,
  );

   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        LoginWidget(),
        StepWidget(),
      ],
    );
  }
}