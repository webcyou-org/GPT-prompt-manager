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
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: Header(),
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
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
                  bottom: 40,
                  height: 70,
                  child: Container(
                      padding: const EdgeInsets.all(12.0),
                      height: 70,
                      // color: Colors.cyan,
                      child: SizedBox(
                          width: size.width * 0.8 - 40,
                          // height: 150,
                          // width: double.infinity,
                          // child: TextField(
                          //   decoration: InputDecoration(
                          //     border: OutlineInputBorder(),
                          //     labelText: 'Send message.',
                          //   ),
                          //   style: TextStyle(
                          //     fontSize: 16,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              // contentPadding: EdgeInsets.all(30),
                              suffixIcon: Icon(Icons.send),
                              border: OutlineInputBorder(),
                              labelText: 'Send message.',
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: Colors.black,
                            ),
                          ))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
