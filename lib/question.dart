import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  /** empty class property - final because it is inside stateless widget which is immutable */
  final String questionText;

/** here we are storing value passed to the constructor of Question class into the property questionText */
/** repeating class name inside the call means that we are creating constructor */
/** class can have multiple constructors, with different configurations/settings */
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    /** style - takes a object as a parameter so we are instantiating object from class TextStyle using TextStyle() */
    /** hit control + space to see list of things to set */
    /** TextAlign is an enum so thats why we use "." to assign "center" */
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
