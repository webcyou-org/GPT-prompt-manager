import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/main.dart';
import 'component/header.dart';
import 'db/database_helper.dart';
// import 'models/prompt.dart' as PromptModel;

class PromptManager extends ConsumerWidget {
  const PromptManager({Key? key}) : super(key: key);

  // final dbHelper = DatabaseHelper.instance;
  //
  // PromptModel.Prompt? _selectedPrompt = null;
  // late Future<PromptModel.Prompt>? _headerSelectedPrompt = null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int pageIndex = ref.watch(appProvider).pageIndex;
    final selectedContent = ref.watch(appProvider).getContent();

    return Scaffold(
        appBar: const Header(),
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
            // selectedIndex: _selectedIndex,
            selectedIndex: pageIndex,
            onDestinationSelected: (index) {
              ref
                  .read(appProvider.notifier)
                  .changePage(pageIndex: index, pageDetailIndex: 0);
            },
          ),
          selectedContent
          // SelectContent()
          // SelectContent(
          //     index: _selectedIndex,
          //     detailIndex: _selectedDetailIndex,
          //     changePageCallBack: (detailIndex,
          //         [PromptModel.Prompt? prompt]) {
          //       if (detailIndex == 2) {
          //         _selectedPrompt = prompt!;
          //       }
          //       // setState(() {
          //       //   _selectedDetailIndex = detailIndex;
          //       // });
          //     },
          //     selectedPrompt: _selectedPrompt,
          //     headerSelectedPrompt: _headerSelectedPrompt)
        ]));
  }
}
