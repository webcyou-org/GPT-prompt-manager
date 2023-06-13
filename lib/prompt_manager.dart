import 'package:flutter/material.dart';
import 'component/header.dart';
import 'screen/home.dart';
import 'screen/prompt.dart';
import 'screen/settings.dart';

class PromptManager extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const PromptManager({Key? key, this.onChanged}) : super(key: key);

  @override
  PromptManagerState createState() => PromptManagerState();
}

class PromptManagerState extends State<PromptManager> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: Row(children: [
          NavigationRail(
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home, color: Colors.white),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark, color: Colors.white),
                label: Text('Prompt'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings, color: Colors.white),
                label: Text('Settings'),
              ),
            ],
            backgroundColor: const Color(0xff202123),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          SelectContent(index: _selectedIndex)
        ]));
  }
}

class SelectContent extends StatelessWidget {
  const SelectContent({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    const List<Widget> _pages = [Home(), Prompt(), Settings()];

    if (_pages.length <= index) {
      return _pages[0];
    }
    return _pages[index];
  }
}
