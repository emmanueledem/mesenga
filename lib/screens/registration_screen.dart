import 'package:flutter/material.dart';
import 'package:mesanga/componennts/actionButton.dart';
import 'package:mesanga/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mesanga/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool _saving = false;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
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
                obscureText: true,
                textAlign: TextAlign.center,
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
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email.toString(), password: password.toString());
                    if (newUser != '') {
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
                buttonName: 'Register',
                buttonColor: KregisterButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
