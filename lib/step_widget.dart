import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StepWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //mainAxisAlignment : MainAxisAlignment.start ,
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            alignment: Alignment.center,
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                   image: AssetImage(
                  'assets/images/rounded.png'),
                   fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
            child: Image(
              image: AssetImage("assets/images/person.png"),
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          Text(
            "يمكنك الاشتراك بكل سهولة",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 10,),
            Text(
              "بخطوات بسيطة جدا يمكنك الاشتراك في مختلف الأنظمة شهري, ربع سنوي او سنوي",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
         SizedBox(height: 60),
          Container(
            width: 150,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: HexColor("##000000"),
                onPrimary: Colors.white,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )
              ),
              child: Text('لنبدأ'),
              onPressed: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 60,
                child: Divider(
                    color: Colors.black,
                  ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 130,
                height: 60,
                child: Divider(
                    color: Colors.black,
                    thickness: 1.5,
                  ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
