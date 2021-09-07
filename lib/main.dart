import 'package:flutter/material.dart';
import 'package:chutter/screens/welcome_screen.dart';
// ignore: unused_import
import 'package:chutter/screens/login_screen.dart';
// ignore: unused_import
import 'package:chutter/screens/registration_screen.dart';
// ignore: unused_import
import 'package:chutter/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}
