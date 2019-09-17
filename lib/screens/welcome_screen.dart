import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import '../components/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcom_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 1), vsync: this, upperBound: 1);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigateTo(screenId) {
    Navigator.pushNamed(context, screenId);
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
                    child: Image.asset('images/logo.png'),
                    height: controller.value * 100,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log in',
              color: Colors.green,
              onPressed: () {
                navigateTo(LoginScreen.id);
              },
            ),
            RoundedButton(
                title: 'Register',
                color: Colors.blue,
                onPressed: () {
                  navigateTo(RegistrationScreen.id);
                })
          ],
        ),
      ),
    );
  }
}
