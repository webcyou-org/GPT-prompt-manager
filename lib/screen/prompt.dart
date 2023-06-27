import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/main.dart';
import 'package:prompt_manager/utils/const.dart';
import 'package:prompt_manager/component/prompt_list.dart';

class Prompt extends ConsumerWidget {
  const Prompt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainProviderNotifier = ref.read(appProvider.notifier);
    final promptProviderNotifier = ref.read(promptManagerProvider.notifier);

    return Expanded(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    ),
                    label: const Text('New'),
                    style: primaryButtonStyle(),
                    onPressed: () {
                      promptProviderNotifier.resetEditPrompt();
                      mainProviderNotifier.changePage('/prompt/new');
                    },
                  ))),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: const [PromptList()],
                      )))),
        ],
      ),
    );
  }
}
