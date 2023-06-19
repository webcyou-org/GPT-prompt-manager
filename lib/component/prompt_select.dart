import 'package:flutter/material.dart';
import 'package:prompt_manager/utils/const.dart';
import '../db/database_helper.dart';
import '../models/prompt.dart';

var spriteNameList = [Prompt(title: 'Article Correction')];

class Select extends StatefulWidget {
  final ValueChanged<dynamic>? onChanged;

  const Select({Key? key, this.onChanged}) : super(key: key);

  @override
  SelectState createState() => SelectState();
}

class SelectState extends State<Select> {
  final dbHelper = DatabaseHelper.instance;
  late Future<List<Prompt>> customPromptList;
  var selectedValue;

  @override
  void initState() {
    super.initState();
    customPromptList = Future<List<Prompt>>(
      () async {
        final allRows = await dbHelper.queryAllRows(promptsTableName);
        final List<Prompt> promptList = allRows
            .map((prompt) => Prompt(
                  id: prompt['_id'],
                  title: prompt['title'],
                  value: prompt['value'],
                ))
            .toList();
        return promptList;
      },
    );
  }

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
                child: FutureBuilder(
                    future: customPromptList,
                    builder: (context, snapshot) {
                      var promptList = [Prompt()];
                      if (snapshot.connectionState == ConnectionState.done) {
                        promptList.removeLast();
                        promptList = snapshot.data!;
                      }

                      return DropdownButton(
                        isExpanded: true,
                        value: selectedValue,
                        underline: Container(),
                        items: _getDropdownMenuItemList(promptList),
                        onChanged: (value) {
                          widget.onChanged!(value!);
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        // selectedItemBuilder: (BuildContext context) {
                        //   return spriteNameList.map((String value) {
                        //     return Align(
                        //       alignment: Alignment.centerLeft,
                        //       child: Text(
                        //         selectedValue,
                        //         style:
                        //             const TextStyle(color: Color(0xff424242)),
                        //       ),
                        //     );
                        //   }).toList();
                        // },
                      );
                    }))));
  }

  List<DropdownMenuItem<String>> _getDropdownMenuItemList(promptList) {
    var dropdownList = <DropdownMenuItem<String>>[];
    if (promptList != null) {
      for (var prompt in promptList) {
        dropdownList.add(DropdownMenuItem<String>(
            value: '${prompt.id}', child: Text(prompt.title)));
      }
    }
    return dropdownList.toList();
  }
}
