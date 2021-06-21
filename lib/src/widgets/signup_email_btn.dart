import 'package:flutter/material.dart';
import 'package:quotes_app/globals/constants.dart';

class SignupWithEmailBtn extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Icon icon;

  const SignupWithEmailBtn({Key key, this.onPressed, this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.resolveWith((states) => 0),
            side: MaterialStateProperty.resolveWith(
                (states) => BorderSide(width: 1, color: xPrimaryColor50)),
            backgroundColor:
                MaterialStateColor.resolveWith((states) => xPrimaryColor10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 12),
            Icon(
              Icons.mail,
              color: xPrimaryColor,
              size: 36,
            ),
            SizedBox(width: 22),
            Text(
              text,
              style: TextStyle(
                color: xPrimaryColor,
                fontSize: 19,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
