import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/logic/auth_service.dart';
import 'package:quotes_app/src/screens/add_quote.dart';
import 'package:quotes_app/src/screens/all_quotes.dart';
import 'package:quotes_app/src/screens/quote_details.dart';

import 'add_new_card_button.dart';

class YourQuotes extends StatefulWidget {
  const YourQuotes({
    Key key,
  }) : super(key: key);

  @override
  _YourQuotesState createState() => _YourQuotesState();
}

class _YourQuotesState extends State<YourQuotes> {
  bool _isInit = true;
  CollectionReference data;

  void _callSetState() {
    //data = FirebaseFirestore.instance.collection('users');

    setState(() {});
  }

  @override
  void initState() {
    _isInit = false;
    data = FirebaseFirestore.instance.collection('users');
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //data
    final user = context.read<AuthService>().user();

    if (!_isInit) {}
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Quotes',
                style: TextStyle(
                  color: xDarkColor,
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(
                          MaterialPageRoute(builder: (context) => AllQuotes()))
                      .then((value) => _callSetState());
                },
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: xDarkColor40,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: FutureBuilder<QuerySnapshot>(
            future: data.doc(user.uid).collection('quotes').get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                //Check if there is data to show
                if (snapshot.data.docs.length < 1) {
                  return AddNewCardButton(onTap: () {
                    Navigator.of(context)
                        .push(
                            MaterialPageRoute(builder: (context) => AddQuote()))
                        .then((_) => _callSetState());
                  });
                }
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.docs.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return AddNewCardButton(onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => AddQuote()))
                              .then((_) => _callSetState());
                        });
                      } else {
                        return YourQuotesCard(
                          ontap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                  builder: (context) => QuoteDetails(
                                    quote: snapshot.data.docs[index - 1],
                                  ),
                                ))
                                .then((_) => _callSetState());
                          },
                          title: snapshot.data.docs[index - 1]['Title'],
                          quote: snapshot.data.docs[index - 1],
                        );
                      }
                    },
                  ),
                );
              }

              return Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.black26,
                    valueColor: AlwaysStoppedAnimation<Color>(xPrimaryColor)),
              );
            },
          ),
        ),
      ],
    );
  }
}

class YourQuotesCard extends StatelessWidget {
  final QueryDocumentSnapshot quote;
  final title;
  final Function ontap;
  const YourQuotesCard({
    Key key,
    this.title,
    this.quote,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
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
              child: Text(
                title,
                style: TextStyle(
                  color: xDarkColor40,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
