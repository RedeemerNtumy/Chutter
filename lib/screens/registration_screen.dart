import 'package:flutter/material.dart';
import 'package:chutter/components/PaddingButton.dart';
import 'package:chutter/constants.dart';

import 'loading_screen_register.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatefulWidget {
  
  RegistrationScreen(
      {required this.warning, required this.color, required this.isVisible});
  late String warning;
  late Color color;
  late bool isVisible;
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState("", "");
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  _RegistrationScreenState(this.email, this.password);

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
              height: 24.0,
            ),
            Center(
              child: Visibility(
                child: Text(
                  widget.warning,
                  style: TextStyle(color: widget.color),
                ),
                visible: widget.isVisible,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
                setState(() {
                  widget.isVisible = false;
                });
              },
              decoration: kforms.copyWith(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: email.isEmpty ? widget.color : Colors.blueAccent,
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
                setState(() {
                  widget.isVisible = false;
                });
              },
              decoration: kforms.copyWith(
                hintText: "Enter your password",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: email.isEmpty ? widget.color : Colors.blueAccent,
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            PaddingButton(
                color: Colors.blueAccent,
                onPressed: () async {
                  try {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Loading(email: email, password: password);
                        },
                      ),
                    );
                  } catch (e) {}
                },
                text: 'Register')
          ],
        ),
      ),
    );
  }
}
