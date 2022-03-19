import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  /** final - it will not change once it get it's initial value,
   * so at start it is empty and then it get value and then it can't be changed,
   * can't change at runtime = "At runtime, an initial, dynamic value can be assigned,
   *  thereafter, the property / variable can't be changed again."
   */
  final Function selectHandler;
  final String answerText;

/** constructor - Answer class is taking two arguments */
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
            /** Colors class has static parameters so you can use it with "." without instantiating it using () */
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: selectHandler,
          child: Text(answerText)),
    );
  }
}
