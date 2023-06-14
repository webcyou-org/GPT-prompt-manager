import 'package:flutter/material.dart';

const chatGPTEndpoint = 'https://api.openai.com/v1/completions';
const chatGPTModel = "text-davinci-003";

OutlineInputBorder inputBorder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Color(0xffD6D6D6),
        width: 1,
      ));
}

InputDecoration inputDecoration(label) {
  return InputDecoration(
    border: inputBorder(),
    labelText: '$label',
    fillColor: Colors.white,
    filled: true,
  );
}

TextStyle inputTextStyle() {
  return const TextStyle(
    fontSize: 16,
    height: 1.5,
    color: Colors.black,
  );
}

Text titleText(text) {
  return Text('$text',
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xFF374151),
        fontWeight: FontWeight.bold,
      ));
}
