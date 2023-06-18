import 'package:flutter/material.dart';
import 'package:prompt_manager/utils/const.dart';
import '../db/database_helper.dart';

class PromptList extends StatefulWidget {
  const PromptList({Key? key}) : super(key: key);

  @override
  PromptListState createState() => PromptListState();
}

class PromptListState extends State<PromptList> {
  final dbHelper = DatabaseHelper.instance;
  late Future<List<dynamic>> customPromptList;

  @override
  void initState() {
    super.initState();
    customPromptList = Future<List<dynamic>>(
      () async {
        return await dbHelper.queryAllRows(promptsTableName);
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
                  _promptItem(promptList[index]['title']),
            );
          }
          return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 0,
              itemBuilder: (BuildContext context, int index) =>
                  _promptItem(''));
        });
  }

  Widget _promptItem(String title) {
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
                title,
                style:
                    const TextStyle(color: Color(0xff374151), fontSize: 18.0),
              ),
            ],
          )),
      onTap: () {
        print("onTap called.");
      },
    );
  }
}
