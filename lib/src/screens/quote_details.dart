import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/logic/auth_service.dart';
import 'package:quotes_app/logic/database_service.dart';
import 'package:quotes_app/src/widgets/app_bar.dart';

class QuoteDetails extends StatefulWidget {
  final QueryDocumentSnapshot quote;

  const QuoteDetails({Key key, this.quote}) : super(key: key);

  @override
  _QuoteDetailsState createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> {
  String _selectedEmotion;

  @override
  void initState() {
    _selectedEmotion = widget.quote["mood"];

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    titleController.text = widget.quote["Title"];
    final TextEditingController textController = TextEditingController();
    textController.text = widget.quote["text"];
    //final TextEditingController moodController = TextEditingController();
    //moodController.text = quote["mood"];

    //dropdown
    List<String> _emotions = ['Happy', 'Bored', 'Sad'];

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          height: 52,
          width: double.infinity,
          child: ElevatedButton(
            child: Text(
              'Update Quote',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            onPressed: () {
              var uid = context.read<AuthService>().user().uid;
              context.read<DatabaseService>().updateQuote(
                    uid: uid,
                    doc: widget.quote.id,
                    mood: _selectedEmotion,
                    title: titleController.text.trim(),
                    text: textController.text.trim(),
                  );
              Navigator.pop(context);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 21,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(quote["Title"]),
              // Text(quote["text"]),

              DropdownButton(
                hint: Text(_selectedEmotion), // Not necessary for Option 1
                value: _selectedEmotion,
                onChanged: (newValue) {
                  setState(() {
                    _selectedEmotion = newValue;
                  });
                },
                items: _emotions.map((emotion) {
                  return DropdownMenuItem(
                    child: new Text(emotion),
                    value: emotion,
                  );
                }).toList(),
              ),

              SizedBox(height: 24), //divider

              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 24), //divider
              TextField(
                maxLines: 6,
                controller: textController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
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
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
