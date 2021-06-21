import 'package:flutter/material.dart';

import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/src/screens/add_quote.dart';

class AddNewCardButton extends StatelessWidget {
  final Function onTap;
  const AddNewCardButton({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: xDarkColor20, width: 1),
            borderRadius: BorderRadius.circular(10)),
        color: xFafafa,
        child: Container(
          width: 120,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add New',
                    style: TextStyle(
                      color: xDarkColor40,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.add_circle_outline,
                    color: xDarkColor40,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
