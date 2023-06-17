import 'package:flutter/material.dart';
import 'component/header.dart';
import 'screen/home.dart';
import 'screen/prompt.dart';
import 'screen/prompt_edit.dart';
import 'screen/settings.dart';

class PromptManager extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const PromptManager({Key? key, this.onChanged}) : super(key: key);

  @override
  PromptManagerState createState() => PromptManagerState();
}

class PromptManagerState extends State<PromptManager> {
  int _selectedIndex = 0;
  int _selectedDetailIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(onClickPromptMenu: (index) {
          setState(() {
            _selectedIndex = 1;
            _selectedDetailIndex = index;
          });
        }),
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
                _selectedDetailIndex = 0;
                _selectedIndex = index;
              });
            },
          ),
          SelectContent(
              index: _selectedIndex, detailIndex: _selectedDetailIndex)
        ]));
  }
}

class SelectContent extends StatelessWidget {
  const SelectContent(
      {super.key, required this.index, required this.detailIndex});
  final int index;
  final int detailIndex;

  @override
  Widget build(BuildContext context) {
    const List<Widget> _pages = [Home(), Prompt(), Settings()];
    const List<Widget> _detailPages = [PromptEdit()];

    if (detailIndex == 0) {
      if (_pages.length <= index) {
        return _pages[0];
      }
    } else {
      return _detailPages[detailIndex - 1];
    }
    return _pages[index];
  }
}
