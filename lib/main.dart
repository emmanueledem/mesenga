import 'package:flutter/material.dart';
import 'package:mesanga/screens/welcome_screen.dart';
import 'package:mesanga/screens/login_screen.dart';
import 'package:mesanga/screens/registration_screen.dart';
import 'package:mesanga/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    FlashChat(),
  );
}

W/DynamiteModule( 3557): Local module descriptor class for com.google.android.gms.providerinstaller.dynamite not found.

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alphabet',
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
