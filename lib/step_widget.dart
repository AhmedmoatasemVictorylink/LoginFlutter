import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_app/login_widget.dart';

class StepWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Container(
            alignment: Alignment.center,
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                   image: AssetImage(
                  'assets/images/rounded.png'),
                   fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
            child: const Image(
              image: AssetImage("assets/images/tutorial_img2.png"),
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          const SizedBox(height: 10,),
          const Text(
            "يمكنك الاشتراك بكل سهولة",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(height: 10,),
            const Text(
              "بخطوات بسيطة جدا يمكنك الاشتراك في مختلف الأنظمة شهري, ربع سنوي او سنوي",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
         const SizedBox(height: 60),
          Container(
            width: 150,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: HexColor("##000000"),
                onPrimary: Colors.white,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )
              ),
              child: const Text('لنبدأ'),
              onPressed: () {
                Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => LoginWidget()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
