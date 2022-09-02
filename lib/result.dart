import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 10) {
      resultText = "Try to improve,";
    } else if (resultScore <= 17) {
      resultText = "You are nice";
    } else if (resultScore <= 25) {
      resultText = "You are great";
    } else {
      resultText = "You are Awesome";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text(
            "Restart Quiz!"
          ),
          textColor: Colors.blue,
          onPressed: resetHandler,
        )
      ]),
    );
  }
}
