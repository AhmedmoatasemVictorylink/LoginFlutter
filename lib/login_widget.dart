import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginWidget extends StatelessWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login.png"),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Image(
                      image: AssetImage("assets/images/sideImage.png"),
                      fit: BoxFit.cover,
                      ),
                  ),
                  SizedBox(height: 50,),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30),
                            )),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                'No account',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                 primary: Colors.black,
                                  ),
                                child: Text(
                                  'Login here',
                                  
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onPressed: () {
                                  //signup screen
                                },
                              ),
                              ],
                            ),
                            ),
                        Container(
                          height: 60,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                              fillColor: Colors.white,
                               filled: true,
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              fillColor: Colors.white,
                               filled: true,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                               primary: HexColor("#FDCC53"),
                                onPrimary: Colors.black,
                               ),
                              child: Text('Login'),
                              onPressed: () {
                                print(nameController.text);
                                print(passwordController.text);
                              },
                            ),
                          ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 10),
                              Container(
                                width: 200,
                                child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: HexColor("#000759"),
                                  onPrimary: Colors.white,
                                 ),
                                child: Text('Facebook login'),
                                onPressed: () {
                                  print("facebook login");
                                },
                              ),
                              ),
                              Container(
                                width: 200,
                                child: OutlinedButton(
                                onPressed: () {},
                                child: Text('Visitor tour'),
                                style: OutlinedButton.styleFrom(
                                side: BorderSide(width: 1, color: Colors.white),
                                 ),
                                )
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                        ))
                      ],
                    ),
                  ),
                ],
              ),
          ),
        );
  }
}