import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/globals/constants.dart';
import 'package:quotes_app/globals/helpers/color.dart';
import 'package:quotes_app/logic/auth_service.dart';
import 'package:quotes_app/logic/database_service.dart';
import 'package:quotes_app/logic/quoteOfTheDay_service.dart';
import 'package:quotes_app/src/screens/home.dart';
import 'package:quotes_app/src/screens/login.dart';
import 'package:quotes_app/src/screens/sign_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        Provider<DatabaseService>(
          create: (_) => DatabaseService(FirebaseFirestore.instance),
        ),
        Provider<QuoteOfTheDayService>(
          create: (_) => QuoteOfTheDayService(),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'lol',
        theme: ThemeData(
          fontFamily: 'Poppins',
          accentColor: Colors.red,
          primarySwatch: generateMaterialColor(color: xPrimaryColor),
        ),
        //home: LoginScreen(),
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeScreen();
    }
    return SignScreen();
  }
}
