import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/logic/auth_service.dart';
import 'package:quotes_app/logic/database_service.dart';
import 'package:quotes_app/src/widgets/app_bar.dart';
import 'package:quotes_app/src/widgets/drawer.dart';
import 'package:quotes_app/src/widgets/quote_of_the_day.dart';
import 'package:quotes_app/src/widgets/your_quotes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MyDrawer(),
        appBar: MyAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 21,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YourQuotes(),
              QuoteOfTheDay(),
            ],
          ),
        ));
  }
}
