import 'package:chutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

// ignore: must_be_immutable
class Loading extends StatefulWidget {
  Loading({required this.email, required this.password});
  late String email;
  late String password;
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    login();
    super.initState();
  }

  void login() async {
    try {
      dynamic user = await _auth.signInWithEmailAndPassword(
          email: widget.email, password: widget.password);
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ChatScreen(user);
            },
          ),
        );
      }
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen(
              warning: "Incorrect Credentials !",
              color: Colors.red,
              isVisible: true,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitWave(
            color: Colors.lightBlue,
            size: 50.0,
          ),
          Text(
            "Logging In",
            style: TextStyle(
                color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
