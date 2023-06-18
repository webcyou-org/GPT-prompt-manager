import 'package:flutter/material.dart';
import 'package:prompt_manager/utils/const.dart';
import '../db/database_helper.dart';
import '../models/prompt.dart';

class PromptList extends StatefulWidget {
  final ValueChanged<Prompt> onCallback;
  const PromptList({super.key, required this.onCallback});

  @override
  PromptListState createState() => PromptListState();
}

class PromptListState extends State<PromptList> {
  final dbHelper = DatabaseHelper.instance;
  late Future<List<Prompt>> customPromptList;

  void _onClickPrompt(Prompt prompt) {
    setState(() {
      widget.onCallback(prompt);
    });
  }

  @override
  void initState() {
    super.initState();
    customPromptList = Future<List<Prompt>>(
      () async {
        final allRows = await dbHelper.queryAllRows(promptsTableName);
        final List<Prompt> promptList = allRows
            .map((prompt) => Prompt(
                  id: prompt['_id'],
                  title: prompt['title'],
                  value: prompt['value'],
                ))
            .toList();
        return promptList;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: customPromptList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var promptList = snapshot.data!;

            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: promptList.length,
              itemBuilder: (BuildContext context, int index) =>
                  _promptItem(promptList[index]),
            );
          }
          return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 0,
              itemBuilder: (BuildContext context, int index) =>
                  _promptItem(Prompt()));
        });
  }

  Widget _promptItem(Prompt prompt) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16, left: 60),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xffD6D6D6)))),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
              ),
              Text(
                prompt.title,
                style:
                    const TextStyle(color: Color(0xff374151), fontSize: 18.0),
              ),
            ],
          )),
      onTap: () {
        _onClickPrompt(prompt);
      },
    );
  }
}
