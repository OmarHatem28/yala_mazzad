import 'package:flutter/material.dart';
import 'package:yala_mazad/home.dart';
import 'package:yala_mazad/login.dart';
import 'package:yala_mazad/signUp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // TODO: logged in or not using shared preference
  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yala Mazad',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Home(),
      routes: {
        '/signUp': (context) => SignUp(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
      },
    );
  }
}