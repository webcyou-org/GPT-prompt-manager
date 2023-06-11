import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const MessageList({Key? key, this.onChanged}) : super(key: key);

  @override
  MessageListState createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 30,
      itemBuilder: (context, index) => ListTile(
        title: Text("item ${index + 1}"),
      ),
    );
  }
}
