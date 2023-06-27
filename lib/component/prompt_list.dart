import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/main.dart';

class PromptList extends ConsumerWidget {
  const PromptList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promptList = ref.watch(promptManagerProvider).promptList;
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: promptList.length,
      itemBuilder: (BuildContext context, int index) =>
          _promptItem(promptList[index], ref),
    );
  }

  Widget _promptItem(dynamic prompt, WidgetRef ref) {
    final mainProviderNotifier = ref.read(appProvider.notifier);
    final promptProviderNotifier = ref.read(promptManagerProvider.notifier);

    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16, left: 60),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xffD6D6D6)))),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
              ),
              Text(
                prompt.title,
                style:
                    const TextStyle(color: Color(0xff374151), fontSize: 18.0),
              ),
            ],
          )),
      onTap: () {
        promptProviderNotifier.setEditPrompt(prompt);
        mainProviderNotifier.changePage('/prompt/edit');
        // _onClickPrompt(prompt);
      },
    );
  }
}
