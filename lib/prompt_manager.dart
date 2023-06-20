import 'package:flutter/material.dart';
import 'component/header.dart';
import 'screen/home.dart';
import 'screen/prompt.dart';
import 'screen/prompt_edit.dart';
import 'screen/settings.dart';
import 'db/database_helper.dart';
import 'models/prompt.dart' as PromptModel;

class PromptManager extends StatefulWidget {
  const PromptManager({Key? key}) : super(key: key);

  @override
  PromptManagerState createState() => PromptManagerState();
}

class PromptManagerState extends State<PromptManager> {
  final dbHelper = DatabaseHelper.instance;

  int _selectedIndex = 0;
  int _selectedDetailIndex = 0;
  PromptModel.Prompt? _selectedPrompt = null;
  late Future<PromptModel.Prompt>? _headerSelectedPrompt = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(onClickPromptMenu: (index) {
          setState(() {
            _selectedIndex = 1;
            _selectedDetailIndex = index;
          });
        }, onChangePromptMenu: (prompt) {
          print(prompt);
          setState(() {
            _headerSelectedPrompt = prompt;
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
              changePageCallBack: (detailIndex, [PromptModel.Prompt? prompt]) {
                if (detailIndex == 2) {
                  _selectedPrompt = prompt!;
                }
                setState(() {
                  _selectedDetailIndex = detailIndex;
                });
              },
              selectedPrompt: _selectedPrompt,
              headerSelectedPrompt: _headerSelectedPrompt)
        ]));
  }
}

class SelectContent extends StatelessWidget {
  SelectContent({
    super.key,
    required this.index,
    required this.detailIndex,
    required this.changePageCallBack,
    required this.selectedPrompt,
    required this.headerSelectedPrompt,
  });

  final int index;
  final int detailIndex;
  final Function changePageCallBack;
  final PromptModel.Prompt? selectedPrompt;
  late Future<PromptModel.Prompt>? headerSelectedPrompt;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Home(
        selectedPrompt: headerSelectedPrompt,
      ),
      Prompt(
        onClickPromptNew: () {
          changePageCallBack(1);
        },
        onClickPromptList: (prompt) {
          changePageCallBack(2, prompt);
        },
      ),
      const Settings()
    ];
    const List<Widget> detailPages = [PromptEdit()];

    if (detailIndex == 0) {
      if (pages.length <= index) {
        return pages[0];
      }
    } else {
      if (detailIndex == 2) {
        return PromptEdit(prompt: selectedPrompt);
      }
      return detailPages[detailIndex - 1];
    }
    return pages[index];
  }
}
