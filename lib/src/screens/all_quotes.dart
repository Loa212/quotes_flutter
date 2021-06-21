import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/logic/auth_service.dart';
import 'package:quotes_app/src/screens/add_quote.dart';
import 'package:quotes_app/src/screens/quote_details.dart';
import 'package:quotes_app/src/widgets/app_bar.dart';
import 'package:quotes_app/src/widgets/btn_primary.dart';

class AllQuotes extends StatefulWidget {
  @override
  _AllQuotesState createState() => _AllQuotesState();
}

class _AllQuotesState extends State<AllQuotes> {
  bool _isInit = true;
  CollectionReference data;

  void _callSetState() {
    setState(() {});
  }

  @override
  void initState() {
    _isInit = false;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // data
    final user = context.read<AuthService>().user();

    if (!_isInit) {
      data = FirebaseFirestore.instance.collection('users');
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 21,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Quotes',
              style: TextStyle(
                color: xDarkColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 36),
            FutureBuilder<QuerySnapshot>(
              future: data.doc(user.uid).collection('quotes').get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  //Check if there is data to show
                  if (snapshot.data.docs.length < 1) {
                    return Center(
                      child: Text('no quotes to show'),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: xDarkColor40),
                                //border bottom only on last element (e.length-1)
                                bottom: index == snapshot.data.docs.length - 1
                                    ? BorderSide(color: xDarkColor40)
                                    : BorderSide.none)),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                  builder: (context) => QuoteDetails(
                                      quote: snapshot.data.docs[index]),
                                ))
                                .then((_) => _callSetState());
                          },
                          title: Text("${snapshot.data.docs[index]['Title']}"),
                          trailing: Text(
                              "${snapshot.data.docs.elementAt(index).id.substring(0, 16)}"),
                        ),
                      ),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 48,
                  width: double.infinity,
                  child: BtnPrimary(
                    text: 'Add new entry',
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                            builder: (context) => AddQuote(),
                          ))
                          .then((_) => _callSetState());
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
