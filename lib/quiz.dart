import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]['questionText'],
        ),
        /** ElevatedButton similarly btn to RaisedButton */
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
             * you can create anonymous function like bellow,
             * "question" is an argument of that anonymous fun,
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
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          /** Answer class takes two arguments,
              * first one is selectHandle (function) and second one is answer */
          /** () => anonymous function - onPressed will trigger answerQuestion() fun */
          return Answer(
            () => answerQuestion(answer['score']),
            answer['text'],
          );
        }).toList()
        /** pass function callback without () to not execute it right away but to send pointer to function */
        // Answer(_answerQuestion),
      ],
      /** ":" = else for if statement that is above */
    );
  }
}
