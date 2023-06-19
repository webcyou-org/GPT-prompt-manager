import 'package:flutter/material.dart';
import '../utils/const.dart';
import '../db/database_helper.dart';
import '../models/prompt.dart';

class PromptEdit extends StatefulWidget {
  final Prompt? prompt;

  const PromptEdit({Key? key, Prompt? this.prompt}) : super(key: key);

  @override
  PromptEditState createState() => PromptEditState();
}

class PromptEditState extends State<PromptEdit> {
  final dbHelper = DatabaseHelper.instance;
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    isEdit = widget.prompt != null;

    if (isEdit) {
      final Prompt prompt = widget.prompt!;
      _titleController.text = prompt.title;
      _valueController.text = prompt.value;
    }
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
                  controller: _titleController,
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
                  controller: _valueController,
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
                      onPressed: () async {
                        if (isEdit) {
                          Map<String, dynamic> row = {
                            '_id': widget.prompt!.id,
                            'title': _titleController.text,
                            'value': _valueController.text,
                          };
                          await dbHelper.update(promptsTableName, row);
                        } else {
                          Map<String, dynamic> row = {
                            'title': _titleController.text,
                            'value': _valueController.text,
                          };
                          await dbHelper.insert(promptsTableName, row);
                        }
                      },
                      child: const Text('Save'),
                    ))),
          ])),
    );
  }
}
