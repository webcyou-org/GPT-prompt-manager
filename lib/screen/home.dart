import 'package:flutter/material.dart';
import '../component/message_list.dart';
import '../utils/const.dart';
import '../utils/http_helper.dart';
import '../db/database_helper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  OverlayEntry? entry;
  final dbHelper = DatabaseHelper.instance;

  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Stack(
        children: [
          SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Column(
                    children: const [
                      MessageList(),
                    ],
                  ))),
          Positioned(
            left: 80,
            bottom: 30,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: SizedBox(
                    width: size.width * 0.8 - 40,
                    child: TextFormField(
                      controller: _messageController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      minLines: 1,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () async {
                              var apiKey = await _getApiKey();
                              callOpenAPI(_messageController.text, apiKey);
                            }),
                        border: inputBorder(),
                        labelText: 'Send message.',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      style: inputTextStyle(),
                    ))),
          )
        ],
      ),
    );
  }

  Future<String> _getApiKey() async {
    final allRows = await dbHelper.queryAllRows(userTableName);
    return allRows.first['apikey'];
  }
}
