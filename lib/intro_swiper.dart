import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import "package:flutter/services.dart";

class IntroSwiper extends StatelessWidget {

  static const platform =  MethodChannel("com.flutter.epic/epic");

  final List<PageViewModel> listPagesViewModel = <PageViewModel>[
  PageViewModel(
  title: "رفيقي هو الاختيار الأمثل للقراءة",
  body: "اكبر مكتبة الكترونية للاستمتاع بالقراءة من خلال كتب اليكترونية",
  image:  Center(child: Image.asset('assets/images/tutorial_img.png')),
  footer: ElevatedButton(
    onPressed: () {
      // On button presed
    },
    child: const Text("التالي"),
  ),
),
  PageViewModel(
  title: "يمكنك الاشتراك بكل سهولة",
  body: "بخطوات بسيطة جدا يمكنك الاشتراك في مختلف الأنظمة شهري, ربع سنوي او سنوي",
  image:  Center(child: Image.asset('assets/images/tutorial_img2.png')),
  footer: ElevatedButton(
    onPressed: () {
      // On button presed
    },
    child: const Text("لنبدأ"),
  ),
),
];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
  pages: listPagesViewModel,
  onDone: () {
    // When done button is press
    getSwiftValue();
  },
  onSkip: () {
    // You can also override onSkip callback
  },
  showSkipButton: true,
  skip: const Icon(Icons.skip_next),
  next: const Icon(Icons.skip_next),
  done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
  dotsDecorator: DotsDecorator(
    size: const Size.square(10.0),
    activeSize: const Size(20.0, 10.0),
    activeColor: Colors.black,
    color: Colors.black26,
    spacing: const EdgeInsets.symmetric(horizontal: 3.0),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0)
    )
  ),
   );
  } 

  void getSwiftValue() async {

   var sendDataMap = <String, dynamic> {
     "value1" : "1"
   };

    String value;

    try {
      value = await platform.invokeMethod("getSwiftValue", sendDataMap);
      print(value);
    } catch (error) {
      print("error is $error");
    }
  }
}