import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/main.dart';
import 'package:prompt_manager/component/prompt_select.dart';

class PromptSelectBox extends ConsumerWidget {
  const PromptSelectBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appProviderNotifier = ref.read(appProvider.notifier);
    final promptProviderNotifier = ref.read(promptManagerProvider.notifier);

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () {
            promptProviderNotifier.resetEditPrompt();
            appProviderNotifier.changePage('/prompt/new');
          },
        ),
        const Select(),
        IconButton(
          icon: const Icon(Icons.edit_note),
          onPressed: () {
            final selectedPrompt =
                ref.read(promptManagerProvider).selectedPrompt;
            promptProviderNotifier.setEditPrompt(selectedPrompt);
            appProviderNotifier.changePage('/prompt/edit');
          },
        ),
      ],
    );
  }
}
