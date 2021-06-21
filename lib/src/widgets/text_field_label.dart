import 'package:flutter/material.dart';
import 'package:quotes_app/globals/constants.dart';

class TextFieldLabel extends StatelessWidget {
  final String title;
  const TextFieldLabel({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: xDarkColor80,
          fontSize: 14,
        ),
      ),
    );
  }
}
