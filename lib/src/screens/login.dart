import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/logic/auth_service.dart';
import 'package:quotes_app/src/widgets/alert_dialog.dart';
import 'package:quotes_app/src/widgets/btn_primary.dart';
import 'package:quotes_app/src/widgets/text_field_label.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //auth
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            color: xPrimaryColor,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          titleSpacing: -10,
          title: Text(
            'Go Back',
            style: TextStyle(
              fontFamily: 'Gelasio',
              color: xPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: xDarkColor,
                        fontFamily: 'Gelasio',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldLabel(
                          title: 'Email',
                        ),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'youremail@example.com',
                          ),
                        ),
                        SizedBox(height: 10), //divider
                        TextFieldLabel(
                          title: 'Password',
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                          ),
                        ),
                        SizedBox(height: 36), //divider
                        Container(
                          height: 56,
                          width: double.infinity,
                          child: BtnPrimary(
                            text: 'Login',
                            onPressed: () {
                              context
                                  .read<AuthService>()
                                  .signIn(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  )
                                  .then((response) {
                                if (response != "ok") {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(response),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Ok'),
                                        )
                                      ],
                                    ),
                                  );
                                } else {
                                  Navigator.pop(context);
                                }
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(120, 40, 120, 10),
                          child: Divider(
                            color: xPrimaryColor60,
                            thickness: 3,
                          ),
                        ),
                        Center(
                          child: Text(
                            "Having trouble logging in?",
                            style: TextStyle(
                              color: xDarkColor80,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Reset your Password",
                              style: TextStyle(
                                color: xDarkColor80,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
