import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/logic/auth_service.dart';
import 'package:quotes_app/src/screens/login.dart';
import 'package:quotes_app/src/screens/sign_up_email.dart';
import 'package:quotes_app/src/widgets/btn_primary.dart';
import 'package:quotes_app/src/widgets/signup_email_btn.dart';
import 'package:quotes_app/src/widgets/text_field_label.dart';
import 'package:sign_button/sign_button.dart';

class SignScreen extends StatefulWidget {
  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  //controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //auth
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                color: xDarkColor,
                fontFamily: 'Gelasio',
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '... first, let’s set up your account',
                  style: TextStyle(
                    color: xPrimaryColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //social Signup

                  SignInButton(
                      btnText: 'Sign up with Google',
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                            width: 1, color: socialSignupBackgroundColor50),
                      ),
                      padding: 12,
                      elevation: 0,
                      buttonType: ButtonType.google,
                      buttonSize: ButtonSize.large,
                      btnTextColor: socialSignupTextColor80,
                      btnColor: socialSignupBackgroundColor10,
                      width: double.infinity,
                      onPressed: () {
                        //sign with Google
                        context.read<AuthService>().signInWithGoogle();
                      }),

                  // SizedBox(height: 18), //divider

                  // SignInButton(
                  //   btnText: 'Sign up with Facebook',
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(5),
                  //     side: BorderSide(
                  //         width: 1, color: socialSignupBackgroundColor50),
                  //   ),
                  //   padding: 12,
                  //   elevation: 0,
                  //   buttonType: ButtonType.facebook,
                  //   buttonSize: ButtonSize.large,
                  //   btnTextColor: socialSignupTextColor80,
                  //   btnColor: socialSignupBackgroundColor10,
                  //   width: double.infinity,
                  //   onPressed: null,
                  // ),

                  SizedBox(height: 18), //divider

                  SignupWithEmailBtn(
                    icon: Icon(
                      Icons.email,
                      color: xPrimaryColor,
                    ),
                    text: 'Sign up with Email',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignupWithEmailScreen(),
                        ),
                      );
                    },
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
                      "Already have an account?",
                      style: TextStyle(
                        color: xDarkColor80,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 14), //divider
                  Container(
                    height: 56,
                    width: double.infinity,
                    child: BtnPrimary(
                      text: 'Login',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
