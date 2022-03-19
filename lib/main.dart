import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

/** the same code can be created with arrow function */
// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// Private class - is created by adding “_” before name of the class
class _MyAppState extends State<MyApp> {
  /** const - value will never change, it will be the same as in the moment
     * of writing, constant in compilation and run time
     */
  /** const variable and constant value "const questions = const [" */
  /** final variable can't be changed on runtime and const values */
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];

  // thats the property of the class - variable inside class
  /** "_" means it is private, same for class */
  var _questionIndex = 0;

/** function for button onPressed - calling answerQuestion() in widget onPressed
 *  is working like passing the value from running the function answerQuestion() not 
 * the function itself, so answerQuestion() will execute function when widget is built
 * but we don't want that we want to execute function after btn press so we are 
 * passing just answerQuestion without parenthesis, without executing it
*/

  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    // update widget - calls build method of the widget in which it was called
    setState(() {
      // so questionIndex will be 0 at the start and after first call it will be 1
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Hello there!'),
          ),
          /** "_questionIndex < questions.length ?" = if (_questionIndex < questions.length) {} */
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              /** forward _totalScore into Result widget (class) */
              : Result(_totalScore)),
    );
  }
}
