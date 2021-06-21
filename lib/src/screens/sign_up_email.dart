import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/logic/auth_service.dart';
import 'package:quotes_app/src/widgets/btn_primary.dart';
import 'package:quotes_app/src/widgets/text_field_label.dart';

class SignupWithEmailScreen extends StatefulWidget {
  @override
  _SignupWithEmailScreenState createState() => _SignupWithEmailScreenState();
}

class _SignupWithEmailScreenState extends State<SignupWithEmailScreen> {
  bool privacyPolicy = false;

  //controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                      'Create New Account',
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
                        SizedBox(height: 10), //divider
                        TextFieldLabel(
                          title: 'Confirm Password',
                        ),
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                          ),
                        ),
                        SizedBox(height: 18), //divider

                        CheckboxListTile(
                          activeColor: xPrimaryColor,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                              'I have read and agree to the Privacy Policy.'),
                          value: privacyPolicy,
                          onChanged: (e) {
                            setState(() {
                              privacyPolicy = e;
                            });
                          },
                        ),

                        SizedBox(height: 36), //divider
                        Container(
                          height: 56,
                          width: double.infinity,
                          child: BtnPrimary(
                            text: 'Create Account',
                            onPressed: () {
                              bool formOk = true;
                              String formError = '';

                              if (emailController.text == '') {
                                formOk = false;
                                formError = 'A valid email address is required';
                              }
                              if (passwordController.text == '') {
                                formOk = false;
                                formError = 'A password required';
                              }

                              if (confirmPasswordController.text !=
                                  passwordController.text) {
                                formOk = false;
                                formError = 'Passwords don\'t match';
                              }

                              if (!privacyPolicy) {
                                formOk = false;
                                formError =
                                    'You have to accept our privacy policy to create an account';
                              }

                              if (!formOk) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      'Check information provided',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    content: Text(formError),
                                    actions: [
                                      Center(
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Ok')),
                                      )
                                    ],
                                  ),
                                );
                                return;
                              }

                              context
                                  .read<AuthService>()
                                  .signUp(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  )
                                  .then((_) => Navigator.pop(context));
                            },
                          ),
                        ),
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
