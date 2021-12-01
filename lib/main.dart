import 'package:flutter/material.dart';

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
  // thats the property of the class - variable inside class
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
    List<String> questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello there!'),
        ),
        body: Column(
          children: <Widget>[
            Text(questions.elementAt(_questionIndex)),
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
            ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 1')),
            ElevatedButton(
                onPressed: _answerQuestion,
                child: Text('Answer 2')), // simillary btn to RaisedButton
            ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 3')),
          ],
        ),
      ),
    );
  }
}
