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

  final List<dynamic> list = [
    DrawableTextField(
        hint: "user name",
        title: "User Name",
        isRequired: true,
        icon: Icons.person,
        onChange: (value) {
          print(value);
        }),
    DrawableTextField(
      hint: "password",
      title: "Password",
      isRequired: true,
      icon: Icons.password,
      onChange: (value) => print(value),
    ),
    DrawableDropDownField(
      title: "Select on of the below",
      hint: "hint",
      isRequired: true,
      icon: Icons.password,
      onChange: (value) => print(value),
      items: ['first', 'second', 'third'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.firebaseOrange,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey, // add the formkey here
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: list[index].widget,
                );
              }),
        ),
      ),
    );
  }
}

abstract class DrawableField<ValueType> {
  String title;
  String hint;
  bool isRequired;
  IconData icon;
  Function(ValueType?) onChange;

  DrawableField({
    required this.title,
    required this.hint,
    required this.isRequired,
    required this.icon,
    required this.onChange,
  });

  Widget get widget;
}

// text filed form field
class DrawableTextField implements DrawableField<String> {
  @override
  String hint;

  @override
  bool isRequired;

  @override
  String title;

  @override
  IconData icon;

  @override
  Function(String?) onChange;

  DrawableTextField({
    required this.title,
    required this.hint,
    required this.isRequired,
    required this.icon,
    required this.onChange,
  });

  @override
  Widget get widget {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: hint,
        labelText: title,
      ),
      validator: (value) {
        if (!isRequired) {
          return null;
        }

        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}

/// Drop down form field
///
class DrawableDropDownField implements DrawableField<String> {
  @override
  String hint;

  @override
  bool isRequired;

  @override
  String title;

  @override
  IconData icon;

  @override
  Function(String?) onChange;

  var selectedValue;

  final bool _isExpanded = true;

  // To be enhanced with generic type to provide title and identifier
  List<String> items;

  DrawableDropDownField({
    required this.title,
    required this.hint,
    required this.isRequired,
    required this.icon,
    required this.onChange,
    required this.items,
  });

  @override
  Widget get widget {
    return DropdownButtonFormField(
      hint: Text(hint),
      isExpanded: _isExpanded,
      items: items.map((value) {
        return DropdownMenuItem(child: Text(value), value: value);
      }).toList(),
      value: selectedValue,
      onChanged: (value) => onChange(value as String),
    );
  }
}

/*
/// Drop down form field
/// 
class DrawableDropDownButtonFoemFled implements DrawableDropDownField {

  @override
  String hint;

  @override
  bool isExpanded;

  @override
  List<String> items;

  @override
  Function() onChanged;

  @override
  Function() onSaved;

  @override
  String selectedValue; 

  DrawableDropDownButtonFoemFled({
    required this.selectedValue,
    required this.hint,
    required this.isExpanded,
    required this.onChanged,
    required this.onSaved,
    required this.items,
  });

  @override
  Widget get widget {
    return DropdownButtonFormField(
        value: selectedValue,
        hint: Text(hint,),
        isExpanded: isExpanded,
        onChanged: onChanged,
        onSaved: onSaved,
        items: items
           .map((String val) {
                return DropdownMenuItem(
                   value: val,
                   child: Text(
                        val,                   
                         ),
                       );
                    }).toList(),
                 );
    }
}
*/

/* Column(children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            list.map((e) => e.widget).first,
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                child: const Text('Send'),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Authentication.customSnackBar(
                      content: 'Error authenticating using Biometrics.',
                    );
                  }
                }
              ),
          ]),*/

/*  String formItems = json.encode([
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
  ]);*/
