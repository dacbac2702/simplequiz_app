import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
  }) : super(key: key);

  final int result;
  final int questionLength;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Kết quả',
                style: TextStyle(color: neutral, fontSize: 22.0),
              ),
              const SizedBox(height: 20.0),
              CircleAvatar(
                child: Text(
                  '$result/$questionLength',
                  style: const TextStyle(fontSize: 30.0),
                ),
                radius: 70.0,
                backgroundColor: result == questionLength / 2
                    ? Colors.yellow // When the result is half of the questions
                    : result < questionLength / 2
                        ? incorrect // When the result is less than half
                        : correct, // When the result is more than half
              ),
              const SizedBox(height: 20.0),
              Text(
              result == questionLength / 2
                  ? 'Bạn khá hiểu biết' // When the result is half of the questions
                  : result < questionLength / 2
                      ? 'Bạn cần cố gắng hơn' // When the result is less than half
                      : 'Bạn rất xuất sắc!', // When the result is more than half
              style: const TextStyle(
                color: neutral,
              ),
            ),
            ]),
      ),
    );
  }
}
