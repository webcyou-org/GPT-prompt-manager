import 'package:flutter/material.dart';
import 'component/header.dart';
import 'component/side_menu.dart';
import 'component/message_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  OverlayEntry? entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
              child: Scrollbar(
                  child: SingleChildScrollView(
                      child: Column(
            children: [
              const MessageList(),
              // Container(
              //   margin: EdgeInsets.all(8.0),
              //   child: TextField(
              //     decoration: InputDecoration(hintText: "Input"),
              //   ),
              // ),
            ],
          )))),
        ],
      ),
    );
  }
}
