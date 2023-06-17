import 'package:flutter/material.dart';

class PromptList extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const PromptList({Key? key, this.onChanged}) : super(key: key);

  @override
  PromptListState createState() => PromptListState();
}

class PromptListState extends State<PromptList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 10,
      // itemBuilder: (context, index) => ListTile(
      //   title: Text("custom prompt ${index + 1}"),
      // ),
      itemBuilder: (BuildContext context, int index) =>
          _promptItem("custom prompt ${index + 1}"),
    );
  }

  Widget _promptItem(String title) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16, left: 60),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xffD6D6D6)))),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
              ),
              Text(
                title,
                style:
                    const TextStyle(color: Color(0xff374151), fontSize: 18.0),
              ),
            ],
          )),
      onTap: () {
        print("onTap called.");
      },
    );
  }
}
