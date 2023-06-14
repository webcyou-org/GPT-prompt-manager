import 'package:flutter/material.dart';
import '../utils/const.dart';

class PromptEdit extends StatefulWidget {
  const PromptEdit({Key? key}) : super(key: key);

  @override
  PromptEditState createState() => PromptEditState();
}

class PromptEditState extends State<PromptEdit> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: titleText('Prompt Name')),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                    child: TextFormField(
                  decoration: inputDecoration('Prompt Name'),
                  style: inputTextStyle(),
                ))),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: titleText('Value')),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                    child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 20,
                  minLines: 10,
                  decoration: inputDecoration('Value'),
                  style: inputTextStyle(),
                ))),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(80, 40),
                        backgroundColor: const Color(0xFF5E47D2),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text('Save'),
                    ))),
          ])),
    );
  }
}
