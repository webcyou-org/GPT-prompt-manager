import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/main.dart';
import '../component/prompt_list.dart';

class Prompt extends ConsumerWidget {
  const Prompt({Key? key}) : super(key: key);
  // final Function onClickPromptList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(80, 40),
                      backgroundColor: const Color(0xFF5E47D2),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      ref
                          .read(appProvider.notifier)
                          .changePage(pageIndex: 1, pageDetailIndex: 2);
                    },
                  ))),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: const [
                          PromptList()
                          // PromptList(
                          //     onCallback: (prompt) =>
                          //         onClickPromptList(prompt)),
                        ],
                      )))),
        ],
      ),
    );
  }
}
