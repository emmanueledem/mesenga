import 'package:flutter/material.dart';
import 'dart:core';

class actionButtons extends StatelessWidget {
  actionButtons(
      {required this.buttonColor,
      required this.buttonName,
      required this.onPressed});

  VoidCallback onPressed;
  String? buttonName;
  Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonName.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
