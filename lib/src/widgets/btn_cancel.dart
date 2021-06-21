import 'package:flutter/material.dart';
import 'package:quotes_app/globals/constants.dart';

class BtnCancel extends StatelessWidget {
  final Function onPressed;
  final String text;

  const BtnCancel({Key key, this.onPressed, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          side: MaterialStateProperty.resolveWith(
              (states) => BorderSide(width: 1, color: xDarkColor20)),
          backgroundColor: MaterialStateColor.resolveWith((states) => xFafafa)),
      child: Text(
        text,
        style: TextStyle(
          color: xDarkColor40,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
