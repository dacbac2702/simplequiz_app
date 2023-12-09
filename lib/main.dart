// Import the material package
import 'package:flutter/material.dart';
import 'package:simplequiz_app/models/db_connect.dart';
import 'package:simplequiz_app/models/question_model.dart';
import './screens/home_screen.dart';

// Run the main method
void main() {
  var db = DBconnect();
  // db.addQuestion(Question(id: '3', title: 'What is 20 x 100?', options: {
  //   '100': false,
  //   '200': true,
  //   '300': false,
  //   '400': false,
  // }));
  db.fetchQuestion();
  // The runApp method
  runApp(
    const MyApp(),
  );
}

// Create the MyApp widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      // Set a homepage
      home: HomeScreen(),
    );
  }
}
