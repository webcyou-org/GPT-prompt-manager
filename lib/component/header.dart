import 'package:flutter/material.dart';
import 'package:prompt_manager/component/prompt_select_box.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(left: 110.0),
        child: PromptSelectBox(),
      ),
      centerTitle: false,
      backgroundColor: const Color(0xff202123),
      elevation: 0.0,
    );
  }
}
