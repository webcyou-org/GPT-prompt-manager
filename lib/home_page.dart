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
                  bottom: 30,
                  height: 45,
                  child: Container(
                      // padding: const EdgeInsets.all(12.0),
                      // height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            // color: Color(0xffD6D6D6),
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
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.all(30),
                              suffixIcon: const Icon(Icons.send),
                              border: inputBorder(),
                              labelText: 'Send message.',
                              fillColor: Colors.white,
                              filled: true,
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

  OutlineInputBorder inputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Color(0xffD6D6D6),
          width: 1,
        ));
  }
}
