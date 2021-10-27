import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login_app/utils/authentication.dart';
import 'package:login_app/utils/custom_colors.dart';

class CreatedForm extends StatefulWidget {
  @override
  _CreatedFormState createState() => _CreatedFormState();
}

class _CreatedFormState extends State<CreatedForm> {
  // dynamic response to store your form data that can be sent as  post request
  dynamic response;

  // set the formkey for validation
  var _formkey = GlobalKey<FormState>();

  final List<DrawableField> list = [
    DrawableTextField(
      hint: "Amu Hint",
      title: "New TextField",
      isRequired: true,
    ),
  ];

  String formItems = json.encode([
    {
      "title": "name",
      "label": "what is your name",
      "type": "text",
      "required": "yes"
    },
    {
      "title": "dateOfReg",
      "label": "what is the date of registration",
      "type": "date",
      "required": "no"
    },
    {
      "title": "agegroup",
      "label": "tell us your age group gbyb",
      "type": "select",
      "items": ["1-20", "21-30", "31-40", "41-50", "51-60"],
      "required": "no"
    }
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.firebaseOrange,
        // title: const Text("JSONFORM"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey, // add the formkey here
          child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                list.map((e) => e.widget).first,
                // const Text(
                //   "Login Form",
                //   style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                // ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     icon: Icon(Icons.person),
                //     hintText: 'Enter your name',
                //     labelText: 'Name',
                //   ),
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter some text';
                //     }
                //     return null;
                //   },
                // ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     icon: Icon(Icons.phone),
                //     hintText: 'Enter a phone number',
                //     labelText: 'Phone',
                //   ),
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter valid phone number';
                //     }
                //     return null;
                //   },
                // ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     icon: Icon(Icons.calendar_today),
                //     hintText: 'Enter your date of birth',
                //     labelText: 'Dob',
                //   ),
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter valid date';
                //     }
                //     return null;
                //   },
                // ),
                // JsonFormGenerator(
                //   form: formItems,
                //   onChanged: (dynamic value) {
                //     setState(() {
                //       this.response = value;
                //     });
                //   },
                // ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    child: const Text('Send'),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        //print(response.toString());
                        Authentication.customSnackBar(
                          content: 'Error authenticating using Biometrics.',
                        );
                      }
                    }),
              ]),
        ),
      ),
    );
  }
}

abstract class DrawableField {
  String title;
  String hint;
  bool isRequired;

  DrawableField({
    required this.title,
    required this.hint,
    required this.isRequired,
  });

  Widget get widget;
}

class DrawableTextField implements DrawableField {

  @override
  String hint;

  @override
  bool isRequired;

  @override
  String title;

  DrawableTextField({
    required this.title,
    required this.hint,
    required this.isRequired,
  });

  @override
  Widget get widget => TextFormField(
        decoration: InputDecoration(
          icon: const Icon(Icons.person),
          hintText: hint,
          labelText: title,
        ),
        validator: (value) {
          if (!isRequired) { return null; }

          if (value!.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      );
}
