import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'prompt_manager.dart';

import 'package:prompt_manager/db/database_helper.dart';
import 'package:prompt_manager/state/app_state.dart';
import 'package:prompt_manager/view_model/app_view_model.dart';
import 'package:prompt_manager/state/prompt_manager_state.dart';
import 'package:prompt_manager/view_model/prompt_manager_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  runApp(const App());
  dbHelper.database;
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatGPT prompt manager Tool',
      home: ProviderScope(child: PromptManager()),
    );
  }
}

final appProvider = StateNotifierProvider<AppStateNotifier, AppState>(
    (ref) => AppStateNotifier());
final promptManagerProvider =
    StateNotifierProvider<PromptManagerStateNotifier, PromptManagerState>(
        (ref) => PromptManagerStateNotifier());
