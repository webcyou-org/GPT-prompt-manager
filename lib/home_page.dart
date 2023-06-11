import 'package:flutter/material.dart';
import 'component/header.dart';
import 'component/side_menu.dart';

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
        body: Stack(
          children: [
            Row(
              children: [
                const SideMenu(),
                Expanded(
                    child: Scrollbar(
                        child: SingleChildScrollView(
                            child: Column(
                  children: [
                    // Container(
                    //   margin: EdgeInsets.all(8.0),
                    //   child: TextField(
                    //     decoration: InputDecoration(hintText: "Input"),
                    //   ),
                    // ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 30,
                      itemBuilder: (context, index) => ListTile(
                        title: Text("item ${index + 1}"),
                      ),
                    ),
                  ],
                )))),
              ],
            ),
          ],
        ));
  }
}
