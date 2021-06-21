import 'package:flutter/material.dart';
import 'package:quotes_app/globals/constants.dart';

class MenuItem extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Icon icon;
  const MenuItem({
    Key key,
    this.title,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(
        title,
        style: TextStyle(
          color: xDarkColor80,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: icon,
    );
  }
}
