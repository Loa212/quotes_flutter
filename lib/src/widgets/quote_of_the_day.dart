import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/logic/Models/quoteOfTheDay_class.dart';
import 'package:quotes_app/logic/quoteOfTheDay_service.dart';
import 'package:quotes_app/src/widgets/quote_of_the_day_actions.dart';

class QuoteOfTheDay extends StatefulWidget {
  const QuoteOfTheDay({
    Key key,
  }) : super(key: key);

  @override
  _QuoteOfTheDayState createState() => _QuoteOfTheDayState();
}

class _QuoteOfTheDayState extends State<QuoteOfTheDay> {
  Future<MyQuoteOfTheDay> futureQuote;

  getData() async {}

  @override
  void initState() {
    super.initState();
    futureQuote = context.read<QuoteOfTheDayService>().fetchQuoteOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quote of the day',
            style: TextStyle(
              color: xDarkColor,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 12),
          Center(
            child: MyCard(futureQuote: futureQuote),
          ),
        ],
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({
    Key key,
    @required this.futureQuote,
  }) : super(key: key);

  final Future<MyQuoteOfTheDay> futureQuote;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('tapped card');
      },
      child: FutureBuilder<MyQuoteOfTheDay>(
        future: futureQuote,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: xDarkColor20, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              color: xFafafa,
              child: Container(
                width: double.infinity,
                //  height: 281,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //'\“The best way to find out if you can trust somebody is to trust them.\”',
                        '\"${snapshot.data.contents.quotes.first.quote}\"',
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              color: xDarkColor40,
                            ),
                          ],
                          fontFamily: 'Redressed',
                          color: xPrimaryColor,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '-${snapshot.data.contents.quotes.first.author}',
                            style: TextStyle(
                              color: xDarkColor80,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      QuoteOfTheDayActions(),
                    ],
                  ),
                ),
              ),
            );
          } else {
            Text('${snapshot.error}');
          }
          return Text('some error');
        },
      ),
    );
  }
}
