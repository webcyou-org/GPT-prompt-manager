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
            child: Stack(
              children: [
                SingleChildScrollView(
                    child: Column(
                  children: const [
                    MessageList(),
                  ],
                )),
                Positioned(
                  left: 40,
                  bottom: 20,
                  height: 40,
                  child: Container(
                      margin: EdgeInsets.all(12.0),
                      height: 20,
                      // child: TextField(
                      //   decoration: InputDecoration(hintText: "Input"),
                      // ),
                      child: const Text('TextField')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
