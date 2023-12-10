// Import the material package
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/question_model.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';
import '../widgets/result_box.dart';
import '../models/db_connect.dart';

// Create the HomeScreen widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Create an object for DBconnect
  var db = DBconnect();
  // List<Question> _questions = [
  //   Question(
  //     id: '1',
  //     title: 'What is 2 + 2?',
  //     options: {'5': false, '30': false, '4': true, '10': false},
  //   ),
  //   Question(
  //     id: '2',
  //     title: 'What is 10 + 20?',
  //     options: {'50': false, '30': true, '40': false, '10': false},
  //   )
  // ];
  late Future _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestion();
  }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }

  // Create an index to loop through _questions
  int index = 0;
  // Create a score variable
  int score = 0;
  // Create a boolean value to check if the user has clicked
  bool isPressed = false;
  // Create a function to display the next question
  bool isAlreadySelected = false;
  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
// This is the block where the questions end.
      showDialog(
          context: context,
          barrierDismissible:
              false, // This will disable the dissmis function on clicking outside of box
          builder: (ctx) => ResultBox(
                result: score, // Total points the user got
                questionLength: questionLength, // Out of how many questions
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++; // When the index will change to 1. rebuild the app.
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Bạn phải chọn một đáp án'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  // Create a function for changing color
  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  // Create a function to start over
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Use the FutureBuilderWidget
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
              // Change the background
              backgroundColor: background,
              appBar: AppBar(
                title: const Text('Kiến thức về M.U'),
                backgroundColor: background,
                shadowColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Score: $score',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(children: [
                  // Add the questionWIdget here
                  QuestionWidget(
                    indexAction: index, // Currently at 0.
                    question: extractedData[index]
                        .title, // Means the first question in the list.
                    totalQuestions:
                        extractedData.length, // Total length of the list
                  ),
                  const Divider(color: neutral),
                  // Add some space
                  const SizedBox(height: 25.0),
                  for (int i = 0; i < extractedData[index].options.length; i++)
                    GestureDetector(
                      onTap: () => checkAnswerAndUpdate(
                          extractedData[index].options.values.toList()[i]),
                      child: OptionCard(
                        option: extractedData[index].options.keys.toList()[i],
                        color: isPressed
                            ? extractedData[index].options.values.toList()[i] ==
                                    true
                                ? correct
                                : incorrect
                            : neutral,
                      ),
                    ),
                ]),
              ),

              // Use the floating action button
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: NextButton(// The above function
                      ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20.0),
                Text(
                  'Vui lòng đợi trong khi câu hỏi đang được tải lên',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          );
        }

        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}

// Import this file to our main.dart file