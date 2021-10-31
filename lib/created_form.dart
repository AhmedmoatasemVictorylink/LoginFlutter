import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login_app/google_map_screen.dart';
import 'package:login_app/home_screen.dart';
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

  List<dynamic> list = [];

  @override
  void initState() {
    super.initState();
    list = [
      DrawableTextField(
          hint: "user name",
          title: "User Name",
          isRequired: true,
          icon: Icons.person,
          onChange: (value) {
            print(value);
          }),
      DrawablePasswordField(
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
      DrawableCheckBoxField(
        title: "This is Checkbox 1",
        hint: "hint",
        isRequired: true,
        icon: Icons.check_box,
        checkbox1: true,
        onChange: (value) {
          print(value);
          setState(() {
            value = !value!;
          });
        },
      ),
      DrawableRadioButtonField(
        gender: "male",
        title: "Gender radio",
        hint: "hint",
        isRequired: true,
        icon: Icons.person,
        onChange: (value) {
          setState(() {
            print(value);
          });
        },
      ),
      DrawableRadioButtonField(
        gender: "female",
        title: "Gender radio",
        hint: "hint",
        isRequired: true,
        icon: Icons.person,
        onChange: (value) {
          setState(() {
            print(value);
          });
        },
      ),
      DrawableMapField(
          title: "map",
          hint: "hint",
          isRequired: true,
          icon: Icons.map,
          onChange: (_) {},
          onNavigate: () {
            print("navigating");
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GoogleMapScreen(),
              ),
            );
          })
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.firebaseNavy,
        title: Text(
          "Dynmaic form",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
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

// text filed form field
class DrawablePasswordField implements DrawableField<String> {
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

  DrawablePasswordField({
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
      keyboardType: TextInputType.text,
      obscureText: true,
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

/// check box form field
///
class DrawableCheckBoxField implements DrawableField<bool> {
  @override
  String hint;

  @override
  bool isRequired;

  @override
  String title;

  @override
  IconData icon;

  @override
  Function(bool?) onChange;

  bool checkbox1 = true;

  DrawableCheckBoxField({
    required this.title,
    required this.hint,
    required this.isRequired,
    required this.icon,
    required this.onChange,
    required this.checkbox1,
  });

  @override
  Widget get widget {
    return Row(children: [
      SizedBox(
        width: 10,
        child: Checkbox(
          value: checkbox1,
          activeColor: Colors.orange,
          onChanged: (value) => onChange(checkbox1 = value as bool),
        ),
      ),
      const SizedBox(width: 10.0),
      Text(title),
    ]);
  }
}

/// radio button form field
///
class DrawableRadioButtonField implements DrawableField<String> {
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

  String gender;

  var selectedValue;

  DrawableRadioButtonField({
    required this.title,
    required this.hint,
    required this.isRequired,
    required this.icon,
    required this.onChange,
    required this.gender,
  });

  @override
  Widget get widget {
    return Row(children: [
      SizedBox(
        width: 10,
        child: Radio<String>(
          value: title,
          groupValue: gender,
          activeColor: Colors.orange,
          onChanged: (value) => onChange(gender = value as String),
        ),
      ),
      const SizedBox(width: 10.0),
      Text(title),
    ]);
  }
}

/// radio button form field
///
class DrawableMapField implements DrawableField<String> {
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

  Function() onNavigate;

  DrawableMapField({
    required this.title,
    required this.hint,
    required this.isRequired,
    required this.icon,
    required this.onChange,
    required this.onNavigate,
  });

  @override
  Widget get widget {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Open map",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onTap: onNavigate,
    );
  }
}
