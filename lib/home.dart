import 'package:firebase_auth/firebase_auth.dart';
import 'package:fllutter_firabase_form/loginpage.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'registration.dart';

class Home extends StatefulWidget {
  String uid;
  String name;
  Home(this.uid, this.name);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'irA',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      // home: HomePage(),
      home: HomePage(),
    );
  }
}
