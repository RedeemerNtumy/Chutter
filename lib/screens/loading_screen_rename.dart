import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  void initState() {
    register();
    super.initState();
  }

  void register() async {
    try {
      dynamic newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ChatScreen(newUser);
        },
      ),
    );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SpinKitWave(
              color: Colors.lightBlue,
              size: 50.0,
            ),
            Text("Registration in process",style: TextStyle(color: Colors.blue,fontSize: 25),)

          ],
        ),
      ),
    );
  }
}
