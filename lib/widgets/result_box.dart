import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
  }) : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback onPressed;
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
                  ? 'Bạn cũng biết chút ít về Quỷ đỏ rùi đấy nhưng cần tìm hiểu thêm thông tin đi nhé' // When the result is half of the questions
                  : result < questionLength / 2
                      ? 'Ôi, bạn gần như chưa biết gì về M.U cả. Thế mà cũng đòi làm fan' // When the result is less than half
                      : 'Bạn đúng là 1 fan cứng của đội bóng. Hãy tiếp tục đồng hành cùng Manchester United nhé!', // When the result is more than half
              style: const TextStyle(
                color: neutral,
              ),
            ),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: onPressed,
              child: const Text(
                'Bắt đầu lại',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
