import "package:flutter/material.dart";
import "./quiz.dart";
import "./result.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      "questionText": "what's your favourite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 3},
        {"text": "Blue", "score": 5},
        {"text": "White", "score": 10}
      ],
    },
    {
      "questionText": "what's your favourite animal?",
      "answers": [
        {"text": "Lion", "score": 5},
        {"text": "Dog", "score": 10},
        {"text": "Cat", "score": 7},
        {"text": "Rabbit", "score": 1}
      ],
    },
    {
      "questionText": "who'your favorite instructor?",
      "answers": [
        {"text": "Max", "score": 10},
        {"text": "Colt", "score": 9},
        {"text": "Angela", "score": 8},
        {"text": "College Prof", "score": 5}
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
    });
    _totalScore += score;
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quiz App")),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
