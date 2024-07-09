import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((e) => Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor:
                              e['user_answer'] == e['correct_answer']
                                  ? const Color.fromARGB(255, 18, 219, 28)
                                  : const Color.fromARGB(255, 240, 39, 24),
                          child: Text(
                            ((e['question_index'] as int) + 1).toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['question'].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                e['user_answer'].toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 64, 192, 234),
                                ),
                              ),
                              Text(
                                e['correct_answer'].toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 5, 101, 236),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
