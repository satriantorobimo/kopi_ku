import 'package:flutter/material.dart';
import 'package:kopi_ku/pages/home.dart';
import 'package:kopi_ku/pages/login_signup_pages.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: const Color(0xFF66bb6a),
          fontFamily: 'Didact',
          primaryTextTheme: TextTheme(
              title: TextStyle(
                  color: Colors.white
              )
          )
        ),

        home: new HomePage()
    );
  }
}