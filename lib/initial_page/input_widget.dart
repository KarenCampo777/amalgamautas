import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {

  final TextEditingController? input;
  final String? inputString;

  const InputWidget({Key? key, this.input, this.inputString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: input,
      decoration: InputDecoration(
        labelText: inputString,
      ),
    );
  }
}
