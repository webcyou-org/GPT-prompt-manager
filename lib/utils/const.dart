import 'package:flutter/material.dart';

const chatGPTEndpoint = 'https://api.openai.com/v1/completions';
const chatGPTModel = "text-davinci-003";

const promptsTableName = 'prompts';
const userTableName = 'user_config';

const double windowWidth = 700;
const double windowHeight = 800;

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

InputDecoration secretInputDecoration(
    String label, bool isObscure, Function callback) {
  return InputDecoration(
    border: inputBorder(),
    labelText: label,
    fillColor: Colors.white,
    filled: true,
    suffixIcon: IconButton(
      icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
      onPressed: () => callback(),
    ),
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

ButtonStyle primaryButtonStyle() {
  return ElevatedButton.styleFrom(
    minimumSize: const Size(80, 40),
    backgroundColor: const Color(0xFF5E47D2),
    foregroundColor: Colors.white,
  );
}
