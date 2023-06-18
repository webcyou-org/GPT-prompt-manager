import 'package:flutter/material.dart';
import 'component/header.dart';
import 'screen/home.dart';
import 'screen/prompt.dart';
import 'screen/prompt_edit.dart';
import 'screen/settings.dart';
import 'db/database_helper.dart';

class PromptManager extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const PromptManager({Key? key, this.onChanged}) : super(key: key);

  @override
  PromptManagerState createState() => PromptManagerState();
}

class PromptManagerState extends State<PromptManager> {
  final dbHelper = DatabaseHelper.instance;

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
              index: _selectedIndex,
              detailIndex: _selectedDetailIndex,
              changePageCallBack: (detailIndex) {
                setState(() {
                  _selectedDetailIndex = detailIndex;
                });
              })
        ]));
  }
}

class SelectContent extends StatelessWidget {
  const SelectContent(
      {super.key,
      required this.index,
      required this.detailIndex,
      required this.changePageCallBack});
  final int index;
  final int detailIndex;
  final Function(int) changePageCallBack;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const Home(),
      Prompt(onClickPromptNew: () {
        changePageCallBack(1);
      }),
      const Settings()
    ];
    const List<Widget> detailPages = [PromptEdit()];

    if (detailIndex == 0) {
      if (pages.length <= index) {
        return pages[0];
      }
    } else {
      return detailPages[detailIndex - 1];
    }
    return pages[index];
  }
}
