import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/questions.dart';
import 'summary.dart' as Sum;

class Result extends StatelessWidget {
  const Result(this.selectedAnswers, this.restart, {super.key});

  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numOfCorrectAnswers = summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;

    return Container(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $numOfCorrectAnswers out of ${questions.length} questions correctly!',
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Sum.Summary(summaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: restart,
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
              label: const Text(
                'Restart the quiz!',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
