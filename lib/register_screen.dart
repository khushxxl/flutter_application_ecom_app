import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';

import 'constants.dart';
import 'rounded_custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(bottom: 80.0),
                child: Text(
                  "Register Now",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: kInputDecoration.copyWith(
                          hintText: 'Enter your email', labelText: "email-id"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: kInputDecoration.copyWith(
                          hintText: 'Enter your password',
                          labelText: "Password"),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
                    child: GestureDetector(
                      child: RoundedCustomButton(
                        text: "Register",
                      ),
                      onTap: () async {
                        try {
                          final newUser = _auth.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          // ignore: unnecessary_null_comparison
                          if (newUser != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          }
                          if (email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Invalid Credentials"),
                            ));
                          }
                          if (password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Invalid Credentials"),
                            ));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Invalid Credentials"),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text("Do you have an account ?"),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
