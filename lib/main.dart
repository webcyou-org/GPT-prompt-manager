import 'package:flutter/material.dart';
import 'prompt_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatGPT prompt manager Tool',
      home: PromptManager(),
    );
  }
}
