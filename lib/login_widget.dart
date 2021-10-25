import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginWidget extends StatelessWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login.png"),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 100,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Image(
                        image: AssetImage("assets/images/sideImage.png"),
                        fit: BoxFit.cover,
                        // width: 300,
                        // height: 200,
                        ),
                    ),
                    SizedBox(height: 20,),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(10),
                              child: const Text(
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
                                  const Text(
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
                                  child: const Text(
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
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
                                const SizedBox(height: 10),
                                Container(
                                  width: 200,
                                  child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: HexColor("#000759"),
                                    onPrimary: Colors.white,
                                   ),
                                  child: const Text('Facebook login'),
                                  onPressed: () {
                                    print("facebook login");
                                  },
                                ),
                                ),
                                Container(
                                  width: 200,
                                  child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Text('Visitor tour'),
                                  style: OutlinedButton.styleFrom(
                                  side: const BorderSide(width: 1, color: Colors.white),
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
          ),
    );
  }
}