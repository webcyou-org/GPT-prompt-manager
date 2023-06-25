import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/main.dart';

class Select extends ConsumerStatefulWidget {
  const Select({Key? key}) : super(key: key);

  @override
  SelectState createState() => SelectState();
}

class SelectState extends ConsumerState<Select> {
  var selectedValue;

  @override
  Widget build(BuildContext context) {
    final promptList = ref.watch(promptManagerProvider).promptList;
    final promptProviderNotifier = ref.read(promptManagerProvider.notifier);

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
                  items: _getDropdownMenuItemList(promptList),
                  onChanged: (value) {
                    promptProviderNotifier.changeSelectedPrompt(value);
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  // selectedItemBuilder: (BuildContext context) {
                  //   return promptList.map((prompt) {
                  //     return Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: Text(
                  //         selectedValue,
                  //         style: const TextStyle(color: Color(0xff424242)),
                  //       ),
                  //     );
                  //   }).toList();
                  // },
                ))));
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
