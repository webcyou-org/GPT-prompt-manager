import 'package:flutter/material.dart';
import 'package:prompt_manager/component/prompt_select.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
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
                onPressed: () {},
              ),
              Select(onChanged: onChanged),
              IconButton(
                icon: const Icon(Icons.edit_note),
                onPressed: () {},
              ),
            ],
          )),
      centerTitle: false,
      backgroundColor: const Color(0xff202123),
      elevation: 0.0,
    );
  }

  void onChanged(String selectedName) {
    print(selectedName);
  }
}
