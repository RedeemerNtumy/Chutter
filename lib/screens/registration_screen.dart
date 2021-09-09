import 'package:flutter/material.dart';
import 'package:chutter/components/PaddingButton.dart';
import 'package:chutter/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "registration";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/chutter.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: forms,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: forms.copyWith(hintText: "Enter your password")
            ),
            SizedBox(
              height: 24.0,
            ),
            PaddingButton(
                color: Colors.blueAccent,
                onPressed: () {
                  //Implement registration functionality.
                },
                text: 'Register')
          ],
        ),
      ),
    );
  }

}
