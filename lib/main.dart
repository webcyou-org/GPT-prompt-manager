import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'prompt_manager.dart';
import 'package:prompt_manager/utils/const.dart';
import 'package:prompt_manager/state/app_state.dart';
import 'package:prompt_manager/view_model/app_view_model.dart';
import 'package:prompt_manager/state/prompt_manager_state.dart';
import 'package:prompt_manager/view_model/prompt_manager_view_model.dart';
import 'package:prompt_manager/state/message_state.dart';
import 'package:prompt_manager/view_model/message_view_model.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupWindow();
  runApp(const App());
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

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    setWindowTitle('ChatGPT Prompt Manager Tool');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

final appProvider = StateNotifierProvider<AppStateNotifier, AppState>(
    (ref) => AppStateNotifier());
final promptManagerProvider =
    StateNotifierProvider<PromptManagerStateNotifier, PromptManagerState>(
        (ref) => PromptManagerStateNotifier());
final messageManagerProvider =
    StateNotifierProvider<MessageStateNotifier, MessageManager>(
        (ref) => MessageStateNotifier());
