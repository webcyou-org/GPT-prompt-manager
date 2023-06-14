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
      itemCount: 30,
      itemBuilder: (context, index) => ListTile(
        title: Text("custom prompt ${index + 1}"),
      ),
    );
  }
}
