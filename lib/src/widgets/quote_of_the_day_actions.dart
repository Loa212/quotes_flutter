import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/logic/auth_service.dart';
import 'package:quotes_app/logic/database_service.dart';

class QuoteOfTheDayActions extends StatelessWidget {
  const QuoteOfTheDayActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          color: xDarkColor80,
          icon: Icon(Icons.content_copy),
          onPressed: () {},
        ),
        IconButton(
          color: xDarkColor80,
          icon: Icon(Icons.save_alt),
          onPressed: () {},
        ),
        IconButton(
          color: xDarkColor80,
          icon: Icon(Icons.share),
          onPressed: () {},
        ),
        IconButton(
          color: xDarkColor80,
          icon: Icon(Icons.favorite_border),
          onPressed: () {
            final user = context.read<AuthService>().user();

            context.read<DatabaseService>().addToFavorites(
                  //TODO:save favorites
                  uid: user.uid,
                  author: 'blank',
                  quote: 'lol',
                );
          },
        ),
      ],
    );
  }
}
