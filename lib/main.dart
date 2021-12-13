import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';

import 'question.dart';

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
  final questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': ['Max', 'Checo', 'Iza', 'Lukas']
    }
  ];

  // thats the property of the class - variable inside class
  /** "_" means it is private, same for class */
  var _questionIndex = 0;

/** function for button onPressed - calling answerQuestion() in widget onPressed
 *  is working like passing the value from running the function answerQuestion() not 
 * the function itself, so answerQuestion() will execute function when widget is built
 * but we don't want that we want to execute function after btn press so we are 
 * passing just answerQuestion without parenthasis, witout executing it
*/
  void _answerQuestion() {
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
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(questions[_questionIndex]['questionText']),
                  /** ElevatedButton simillary btn to RaisedButton */
                  // RaisedButton(
                  //     child: Text('Answer 1'),
                  //     onPressed:
                  //         () {
                  //       print('Answer question!');
                  //     },), // deprecated btn, onPressed: answerQuestion -- passing the name of the function which will be executed after btn press
                  // RaisedButton(
                  //     child: Text('Answer 1'),
                  //     onPressed: () => print(
                  //         'Answer chosen!')), // you can define a function inside widget

                  /** map takes a function - you can create simple fun and pass it to map or
             * you can create anonymus function like bellow,
             * "question" is an argument of that anonymus fun,
             * map will run the function on every element of the list,
             * map will return a new list
             */

                  /** "..." spread operator - it will take all the values from the list of lists
             * and add it to the main list --we need this to pass list values to Column widget,
             * without it we will be adding list of list to Column which will not work
             */

                  /** "questions[_questionIndex]['answers']" --access questions list
             * and then get the current element from that list = "_questionIndex"
             * and then go to "answers" list
             */
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    /** Answer class takes two arguments,
              * first one is selectHandle (function) and second one is answer */
                    return Answer(_answerQuestion, answer);
                  }).toList()
                  /** pass function callback without () to not execute it right away but to send pointer to function */
                  // Answer(_answerQuestion),
                ],
                /** ":" = else for if statment that is above */
              )
            : Center(
                child: Text('You won'),
              ),
      ),
    );
  }
}
