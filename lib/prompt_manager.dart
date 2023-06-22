import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/main.dart';
import 'component/header.dart';
import 'db/database_helper.dart';
// import 'models/prompt.dart' as PromptModel;

class PromptManager extends ConsumerWidget {
  const PromptManager({Key? key}) : super(key: key);

  // final dbHelper = DatabaseHelper.instance;
  // late Future<PromptModel.Prompt>? _headerSelectedPrompt = null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainProvider = ref.watch(appProvider);
    final mainProviderNotifier = ref.read(appProvider.notifier);

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
            selectedIndex: mainProvider.pageIndex,
            onDestinationSelected: (index) {
              mainProviderNotifier.changePage(
                  pageIndex: index, pageDetailIndex: 0);
            },
          ),
          mainProvider.selectedContent
        ]));
  }
}
