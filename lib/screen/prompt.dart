import 'package:flutter/material.dart';

class Prompt extends StatefulWidget {
  const Prompt({Key? key}) : super(key: key);

  @override
  PromptState createState() => PromptState();
}

class PromptState extends State<Prompt> {
  OverlayEntry? entry;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: const Color.fromARGB(55, 222, 110, 0)!,
        child: const Center(
          child: Text('PromptPage'),
        ),
      ),
    );
  }
}
