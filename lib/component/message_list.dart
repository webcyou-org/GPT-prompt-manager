import 'package:flutter/material.dart';
import '../models/message.dart';

class MessageList extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const MessageList({Key? key, this.onChanged}) : super(key: key);

  @override
  MessageListState createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  List<Message> messageList = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: messageList.length,
      itemBuilder: (BuildContext context, int index) =>
          _messageItem(messageList[index].text, messageList[index].isChatGPT),
    );
  }

  Widget _messageItem(String message, bool isChatGPT) {
    return Container(
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 60, right: 40),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.0, color: Color(0xffD6D6D6)))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 36.0),
                    child: isChatGPT
                        ? Image.asset('assets/images/icon_chatgpt.png')
                        : Image.asset('assets/images/icon_user.png'),
                  ),
                  Flexible(
                      child: Text(
                    message,
                    style: const TextStyle(
                        color: Color(0xff374151), fontSize: 14.0),
                  )),
                ],
              )
            ]));
  }

  setMessage(Message message) {
    setState(() {
      messageList.add(message);
    });
  }
}
