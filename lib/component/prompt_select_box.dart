import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/main.dart';
import 'package:prompt_manager/component/prompt_select.dart';

class PromptSelectBox extends ConsumerWidget {
  const PromptSelectBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appProviderNotifier = ref.read(appProvider.notifier);

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () {
            appProviderNotifier.changePage(pageIndex: 1, pageDetailIndex: 1);
          },
        ),
        Select(onChanged: (promptId) => {}),
        IconButton(
          icon: const Icon(Icons.edit_note),
          onPressed: () {
            appProviderNotifier.changePage(pageIndex: 1, pageDetailIndex: 1);
          },
        ),
      ],
    );
  }
}
