import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  OverlayEntry? entry;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: const Color.fromARGB(55, 222, 110, 0)!,
        child: const Center(
          child: Text('SettingsPage'),
        ),
      ),
    );
  }
}
