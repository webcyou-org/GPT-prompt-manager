import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        width: 100,
        child: Text('home'),
      ),
      centerTitle: false,
      backgroundColor: const Color(0xff202123),
      elevation: 0.0,

    );
  }
}