import 'package:flutter/material.dart';
import 'package:quotes_app/logic/auth_service.dart';
import 'package:provider/provider.dart';

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text("Yes, log me out"),
    onPressed: () {
      Navigator.pop(context);
      context.read<AuthService>().signOut();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Are you sure you want to Log Out?"),
    //content: Text("Are you sure you want to Log Out?"),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cancelButton,
          continueButton,
        ],
      ),
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
