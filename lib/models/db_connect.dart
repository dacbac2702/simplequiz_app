import 'package:http/http.dart' as http; // The http package
import './question_model.dart';
import 'dart:convert';

class DBconnect {
  // Create  a function to add a question to database.
  // Declare the name of the table to create and add .json as suffix
  final url = Uri.parse(
      'https://simplequizapp-5bd70-default-rtdb.firebaseio.com/questions.json');
  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: json.encode({
          'title': question.title,
          'options': question.options,
        }));
  }
}
