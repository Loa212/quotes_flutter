import 'package:flutter/material.dart';
import 'package:quotes_app/globals/constants.dart';

class BtnPrimary extends StatelessWidget {
  final Function onPressed;
  final String text;

  const BtnPrimary({Key key, this.onPressed, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => xPrimaryColor),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
