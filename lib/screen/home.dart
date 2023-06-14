import 'package:flutter/material.dart';
import '../component/message_list.dart';
import '../utils/const.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  OverlayEntry? entry;

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
            // height: 45,
            child: Container(
                // height: null,
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
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      minLines: 1,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.send),
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
}
