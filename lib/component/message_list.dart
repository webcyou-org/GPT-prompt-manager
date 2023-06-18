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
      itemBuilder: (BuildContext context, int index) => _messageItem(
        "以下の文章から誤字・脱字、タイプミスを見つけました。\n ・「どもです。」 → 「こんにちは。」\n ・「久々な感じです。」 → 「久しぶりの感じです。」 ${index + 1}",
        index % 2 == 0
            ? Image.asset('assets/images/icon_chatgpt.png')
            : Image.asset('assets/images/icon_user.png'),
      ),
    );
  }

  Widget _messageItem(String message, Image icon) {
    return Container(
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 60, right: 40),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.0, color: Color(0xffD6D6D6)))),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 36.0),
              child: icon,
            ),
            Flexible(
                child: Text(
              message,
              style: const TextStyle(color: Color(0xff374151), fontSize: 14.0),
            )),
          ],
        ));
  }
}
