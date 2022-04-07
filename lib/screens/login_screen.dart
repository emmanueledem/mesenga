import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mesanga/componennts/actionButton.dart';
import 'package:mesanga/constant.dart';
import 'package:mesanga/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  String? email;
  String? password;
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: KinputdecorationStyle.copyWith(
                    hintText: 'Enter Your Email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: KinputdecorationStyle.copyWith(
                    hintText: 'Enter Your Password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              actionButtons(
                onPressed: () async {
                  setState(() {
                    _saving = true;
                  });
                  try {
                    final signInUser = await _auth.signInWithEmailAndPassword(
                        email: email.toString(), password: password.toString());
                    if (signInUser != '') {
                      Navigator.pushNamed(context, ChatScreen.id);
                      setState(() {
                        _saving = false;
                      });
                    } else {
                      setState(() {
                        _saving = false;
                      });
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                buttonName: 'Log In',
                buttonColor: KLoginButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
