import 'package:chutter/screens/login_screen.dart';
import 'package:chutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chutter/components/PaddingButton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/chutter.png'),
                    height: 60.0,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Chutter',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: controller.value * 40,
            ),
            PaddingButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen(
                            warning: "Incorrect Credentials !",
                            color: Colors.blueAccent,
                            isVisible: false);
                      },
                    ),
                  );
                },
                text: "Log In"),
            PaddingButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegistrationScreen(
                        warning: "Registration Failed !",
                        color: Colors.blueAccent,
                        isVisible: false);
                  }));
                },
                text: "Register"),
          ],
        ),
      ),
    );
  }
}
