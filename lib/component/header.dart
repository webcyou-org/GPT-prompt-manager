import 'package:flutter/material.dart';
import 'package:prompt_manager/component/prompt_select_box.dart';
import 'package:prompt_manager/component/prompt_select.dart';
import 'package:prompt_manager/models/prompt.dart';
import 'package:prompt_manager/utils/const.dart';
import '../db/database_helper.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);
  // Header({
  //   Key? key,
  //   required this.onClickPromptMenu,
  //   required this.onChangePromptMenu,
  //   Prompt? selectedPrompt,
  // }) : super(key: key);
  //
  // final Function(int) onClickPromptMenu;
  // final Function onChangePromptMenu;
  // final dbHelper = DatabaseHelper.instance;
  //
  // var selectedPrompt;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(left: 110.0),
        child: PromptSelectBox(),
        // child: Row(
        //   children: [
        //     IconButton(
        //       icon: const Icon(Icons.add_circle_outline),
        //       onPressed: () {
        //         onClickPromptMenu(1);
        //       },
        //     ),
        //     Select(onChanged: onChanged),
        //     IconButton(
        //       icon: const Icon(Icons.edit_note),
        //       onPressed: () {
        //         onClickPromptMenu(1);
        //       },
        //     ),
        //   ],
        // )
      ),
      centerTitle: false,
      backgroundColor: const Color(0xff202123),
      elevation: 0.0,
    );
  }

  // void onChanged(promptId) {
  //   selectedPrompt = Future<Prompt>(
  //     () async {
  //       final prompt =
  //           await dbHelper.queryRow(promptsTableName, int.parse(promptId));
  //       return prompt
  //           .map((prompt) => Prompt(
  //                 id: prompt['_id'],
  //                 title: prompt['title'],
  //                 value: prompt['value'],
  //               ))
  //           .toList()
  //           .first;
  //     },
  //   );
  //   onChangePromptMenu(selectedPrompt);
  // }
}
