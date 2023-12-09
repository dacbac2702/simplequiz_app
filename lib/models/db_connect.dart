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

  // Fetch the data from database
  Future<void> fetchQuestion() async {
    http.get(url).then((response) {
      // The 'then' method returns a 'response' which is data
      // To whats inside to decode it first
      var data = json.decode(response.body);
      print(data);
    });
  }
}
