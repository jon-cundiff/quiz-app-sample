import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Blue", "score": 4},
        {"text": "Red", "score": 6},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 0}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Cat", "score": 10},
        {"text": "Dog", "score": 1},
        {"text": "Rabbit", "score": 8},
        {"text": "Llama", "score": 0}
      ]
    },
    {
      "questionText": "Who's your favorite instructor?",
      "answers": [
        {"text": "Max", "score": 0},
        {"text": "Suzie", "score": 1},
        {"text": "Jon", "score": 6},
        {"text": "Steven", "score": 2}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
    print(_questionIndex);
  }

  void _restartQuiz() {
    _totalScore = 0;
    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                index: _questionIndex,
              )
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
