import 'package:flutter/material.dart';
import 'package:quotes_app/src/screens/all_quotes.dart';

import 'alert_dialog.dart';
import 'menu_item.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
              label: Text(
                'close',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  MenuItem(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AllQuotes(),
                        ),
                      );
                    },
                    title: 'Your Quotes',
                    icon: Icon(Icons.lightbulb),
                  ),
                  MenuItem(
                    onPressed: () {},
                    title: 'Favorites',
                    icon: Icon(Icons.favorite),
                  ),
                  MenuItem(
                    onPressed: () {},
                    title: 'Account',
                    icon: Icon(Icons.person),
                  ),
                  MenuItem(
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    title: 'Log Out',
                    icon: Icon(Icons.logout),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
