import 'package:flutter/material.dart';
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
    register();
    super.initState();
  }

  void register() async {
    try {
      dynamic newUser = await _auth.createUserWithEmailAndPassword(
          email: widget.email, password: widget.password);
      if (newUser != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ChatScreen(newUser);
            },
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
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
            "Registration in progress",
            style: TextStyle(
                color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
