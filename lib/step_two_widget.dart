import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Step2Widget extends StatelessWidget {
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
            child: const Image(
              image: AssetImage("assets/images/tutorial_img.png"),
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          SizedBox(height: 10,),
          const Text(
            "رفيقي هو الاختيار الأمثل للقراءة",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 10,),
            const Text(
              "اكبر مكتبة الكترونية للاستمتاع بالقراءة من خلال كتب اليكترونية",
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
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )
              ),
              child: Text('التالي'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}