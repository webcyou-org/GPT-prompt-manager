import 'package:flutter/material.dart';
import 'package:prompt_manager/component/prompt_select.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    Key? key,
    required this.onClickPromptMenu,
  }) : super(key: key);

  final Function(int) onClickPromptMenu;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
          padding: const EdgeInsets.only(left: 110.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  onClickPromptMenu(1);
                },
              ),
              Select(onChanged: onChanged),
              IconButton(
                icon: const Icon(Icons.edit_note),
                onPressed: () {
                  onClickPromptMenu(1);
                },
              ),
            ],
          )),
      centerTitle: false,
      backgroundColor: const Color(0xff202123),
      elevation: 0.0,
    );
  }

  void onChanged(selectedName) {
    print(selectedName);
  }
}
