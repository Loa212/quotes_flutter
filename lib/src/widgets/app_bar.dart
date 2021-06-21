import 'package:flutter/material.dart';
import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/src/screens/home.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      //automaticallyImplyLeading: false,
      //titleSpacing: -10,
      iconTheme: IconThemeData(color: xPrimaryColor),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: InkWell(
        onTap: () {
          //TODO: avoid on HomeScreen()
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
        },
        child: Text(
          'DailyQuotes',
          style: TextStyle(
            color: xPrimaryColor80,
            fontFamily: 'Gelasio',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(kToolbarHeight);
  }
}
