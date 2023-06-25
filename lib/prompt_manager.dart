import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/main.dart';
import 'package:prompt_manager/component/header.dart';
import 'package:prompt_manager/db/database_helper.dart';
import 'package:prompt_manager/utils/const.dart';

class PromptManager extends ConsumerStatefulWidget {
  const PromptManager({Key? key}) : super(key: key);

  @override
  PromptManagerViewState createState() => PromptManagerViewState();
}

class PromptManagerViewState extends ConsumerState<PromptManager> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initialize());
  }

  Future<void> initialize() async {
    final mainProviderNotifier = ref.read(appProvider.notifier);
    final promptManagerNotifier = ref.read(promptManagerProvider.notifier);

    DatabaseHelper dbHelper = DatabaseHelper.instance;
    final apikey = await dbHelper.apikey;
    final configTableRowCount = await dbHelper.queryRowCount(userTableName);
    final promptList = await dbHelper.promptList;

    mainProviderNotifier.setApikey(apikey);
    mainProviderNotifier.setIsConfigTableRow(configTableRowCount! > 0);
    promptManagerNotifier.setPromptList(promptList);
  }

  @override
  Widget build(BuildContext context) {
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
