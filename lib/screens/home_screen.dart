// Import the material package
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/question_model.dart';
import '../widgets/question_widget.dart';

// Create the HomeScreen widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> _questions = [
    Question(
      id: '1',
      title: 'What is 2 + 2?',
      options: {'5': false, '30': false, '4': true, '10': false},
    ),
    Question(
      id: '2',
      title: 'What is 10 + 20?',
      options: {'50': false, '30': true, '40': false, '10': false},
    )
  ];

  // Create an index to loop through _questions
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Change the background
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          // Add the questionWIdget here
          QuestionWidget(
            indexAction: index, // Currently at 0.
            question: _questions[index]
                .title, // Means the first question in the list.
            totalQuestions: _questions.length, // Total length of the list
          ),
          const Divider(color: neutral),
        ]),
      ),
    );
  }
}

// import this file to our main.dart file