import 'package:flutter/material.dart';
import 'homepage.dart';
import 'signup.dart';
import 'userscreen.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,        
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
      ),
      home: HomePage(),
      routes: {
        SignUp.routename: (ctx) => SignUp(),
        UserScreen.routename: (ctx) => UserScreen(),
        
      },
    );
  }
}
