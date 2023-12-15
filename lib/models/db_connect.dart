import 'package:http/http.dart' as http; // The http package
import './question_model.dart';
import 'dart:convert';
import 'dart:math';

class DBconnect {
  // Create  a function to add a question to database.
  // Declare the name of the table to create and add .json as suffix
  final url = Uri.parse(
      'https://simplequizapp-5bd70-default-rtdb.firebaseio.com/questions.json');

  // Fetch the data from database
  Future<List<Question>> fetchQuestion() async {
    return http.get(url).then((response) {
      // The 'then' method returns a 'response' which is data
      // To whats inside to decode it first
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          id: key,
          title: value['title'],
          options: Map.castFrom(value['options']),
        );
        // Shuffle the questions using a random number generator
        final random = Random();
        newQuestions.shuffle(random);
        // Add to newQuestions
        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });
  }
}
