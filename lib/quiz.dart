import 'package:flutter/material.dart';

import 'colors.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _score = 0;
  int _increment = 1;
  int _selectedQuestion = 0;
  List _questions = [
    {
      "question": "How many oscars did the Titanic movie got?",
      "answers": [
        {"response": "11", "value": true},
        {"response": "8", "value": false},
        {"response": "9", "value": false}
      ]
    },
    {
      "question": "In what year was Google launched on the web?",
      "answers": [
        {"response": "1992", "value": false},
        {"response": "1995", "value": false},
        {"response": "1998", "value": true}
      ]
    },
    {
      "question": "How long is the Great Wall of China?",
      "answers": [
        {"response": "4000 miles", "value": true},
        {"response": "3000 miles", "value": true},
        {"response": "5000 miles", "value": true}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Quiz'),
        ),
      ),
      body: Container(
        color: Color(secondaryColor),
        child: (_selectedQuestion >= _questions.length)
            ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        "You've got  ${((_score / _questions.length)*100).round()}% of answers right !"),
                  ),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                      setState(() {
                        _score = 0;
                        _selectedQuestion = 0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Replay"
                          ,style:Theme.of(context).textTheme.body2),
                    ),
                  )
                ],
              ),
            )
            : ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: ListTile(
                      title: Center(
                          child: Text(
                        "Question ${1 + _selectedQuestion}/${_questions.length}",
                        style: Theme.of(context).textTheme.body1,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40.0, horizontal: 8.0),
                    child: ListTile(
                      title: Text(
                        _questions[_selectedQuestion]["question"],
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ),
                  ),
                  ...(_questions[_selectedQuestion]["answers"]
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            setState(() {
                              if (answer["value"] == true) _score += _increment;
                              ++_selectedQuestion;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              answer["response"],
                              style: Theme.of(context).textTheme.body2,
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
      ),
    );
  }
}
