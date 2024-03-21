import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final int questionIndex;
  final Function answerQuestions;

  Quiz(
      {required this.questions,
      required this.answerQuestions,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, dynamic>>)
            .map((answer) {
          // We are using an anonymous function () => below so that
          // we can pass a method through the void function answerQuestions
          // in the main.dart file.
          return Answer(() => answerQuestions(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
