import 'package:flutter/material.dart';
import 'package:chutter/screens/welcome_screen.dart';
import 'package:chutter/screens/login_screen.dart';
import 'package:chutter/screens/registration_screen.dart';
import 'package:chutter/screens/chat_screen.dart';


void main() => runApp(Chutter());

class Chutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        });
  }
}

