import 'package:flutter/material.dart';

const spriteNameList = ['Article Correction', 'Text Translation'];

class Select extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const Select({Key? key, this.onChanged}) : super(key: key);

  @override
  SelectState createState() => SelectState();
}

class SelectState extends State<Select> {
  var selectedValue = spriteNameList.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 256,
        height: 36,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: DropdownButton(
                  isExpanded: true,
                  value: selectedValue,
                  underline: Container(),
                  items: spriteNameList
                      .map((String list) => DropdownMenuItem(
                          value: list,
                          child: Text(
                            list,
                          )))
                      .toList(),
                  onChanged: (String? value) {
                    widget.onChanged!(value!);
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  selectedItemBuilder: (BuildContext context) {
                    return spriteNameList.map((String value) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          selectedValue,
                          style: const TextStyle(color: Color(0xff424242)),
                        ),
                      );
                    }).toList();
                  },
                ))));
  }
}
