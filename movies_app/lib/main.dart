import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Screens/MovieListPage.dart';
import 'package:movies_app/Screens/SearchMovies.dart';
import 'package:movies_app/Services/FirebaseServices.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        backgroundColor: Colors.black87,
        buttonColor: Colors.red,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 50, color: Colors.red[900], fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
            headline3: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300)
        )
      ),
      home: SearchMoviePage(),
    );
  }
}

