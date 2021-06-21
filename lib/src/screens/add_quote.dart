import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/logic/auth_service.dart';
import 'package:quotes_app/logic/database_service.dart';
import 'package:quotes_app/src/widgets/app_bar.dart';
import 'package:quotes_app/src/widgets/btn_cancel.dart';
import 'package:quotes_app/src/widgets/btn_primary.dart';

class AddQuote extends StatefulWidget {
  @override
  _AddQuoteState createState() => _AddQuoteState();
}

class _AddQuoteState extends State<AddQuote> {
  List<String> _emotions = ['Happy', 'Bored', 'Sad'];
  String _selectedEmotion;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController quoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Write your own Quote',
              style: TextStyle(
                color: xDarkColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                  hint: Text('How do you feel?'), // Not necessary for Option 1
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
                Text('23/03/2021'),
              ],
            ),

            TextField(
              controller: titleController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title',
              ),
            ),
            SizedBox(
              height: 36,
            ),
            TextField(
              maxLines: 5,
              controller: quoteController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Your Awesome Quote',
              ),
            ),

            //BUTTONS
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 48,
                        width: 114,
                        child: BtnCancel(
                          text: 'Cancel',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 24), //divider
                      Expanded(
                        child: Container(
                          height: 48,
                          child: BtnPrimary(
                            text: 'Add entry',
                            onPressed: () {
                              //get current user
                              final user = context.read<AuthService>().user();
                              //write on database
                              //titleController.text.trim()
                              context.read<DatabaseService>().addQuote(
                                    uid: user.uid,
                                    title: titleController.text.trim(),
                                    mood: _selectedEmotion,
                                    text: quoteController.text.trim(),
                                  );

                              //pop
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
