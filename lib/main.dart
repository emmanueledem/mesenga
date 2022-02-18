import 'package:flutter/material.dart';
import 'package:mesanga/screens/welcome_screen.dart';
import 'package:mesanga/screens/login_screen.dart';
import 'package:mesanga/screens/registration_screen.dart';
import 'package:mesanga/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
