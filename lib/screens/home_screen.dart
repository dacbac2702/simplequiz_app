// Import the material package
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/question_model.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';

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
  // Create a boolean value to check if the user has clicked
  bool isPressed = false;
  // Create a function to display the next question
  void nextQuestion() {
    if (index == _questions.length - 1) {
      return;
    } else {
      setState(() {
        index++; // When the index will change to 1. rebuild the app.
        isPressed = false;
      });
    }
  }

  // Create a function for changing color
  void changeColor() {
    setState(() {
      isPressed = true;
    });
  }

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
          // Add some space
          const SizedBox(height: 25.0),
          for (int i = 0; i < _questions[index].options.length; i++)
            OptionCard(
              option: _questions[index].options.keys.toList()[i],
              color: isPressed
                  ? _questions[index].options.values.toList()[i] == true
                      ? correct
                      : incorrect
                  : neutral,
              onTap: changeColor,
            ),
        ]),
      ),

      // Use the floating action button
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion, // The above function
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Import this file to our main.dart file