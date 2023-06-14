import 'package:flutter/material.dart';
import '../component/prompt_list.dart';

class PromptListScreen extends StatefulWidget {
  const PromptListScreen({Key? key}) : super(key: key);

  @override
  PromptListScreenState createState() => PromptListScreenState();
}

class PromptListScreenState extends State<PromptListScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    ),
                    label: const Text('New'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(80, 40),
                      backgroundColor: const Color(0xFF5E47D2),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                  ))),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: const [
                          PromptList(),
                        ],
                      )))),
        ],
      ),
    );
  }
}
