import 'package:flutter/material.dart';
import 'package:chutter/components/PaddingButton.dart';
import 'package:chutter/constants.dart';
import 'loading_screen_login.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/chutter.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: kforms,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kforms.copyWith(hintText: "Enter your password"),
            ),
            SizedBox(
              height: 24.0,
            ),
            PaddingButton(
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Loading(email: email,password: password);
        },
      ),
    );

                },
                text: 'Log In')
          ],
        ),
      ),
    );
  }
}
