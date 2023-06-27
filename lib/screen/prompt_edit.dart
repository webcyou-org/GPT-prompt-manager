import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/main.dart';
import 'package:prompt_manager/utils/const.dart';

class PromptEdit extends ConsumerStatefulWidget {
  const PromptEdit({Key? key}) : super(key: key);

  @override
  PromptEditState createState() => PromptEditState();
}

class PromptEditState extends ConsumerState<PromptEdit> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mainProviderNotifier = ref.read(appProvider.notifier);
    final promptProviderNotifier = ref.read(promptManagerProvider.notifier);
    final editPrompt = ref.watch(promptManagerProvider).editPrompt;
    _titleController.text = editPrompt.title;
    _valueController.text = editPrompt.value;

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: titleText('Prompt Name')),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                    child: TextFormField(
                  controller: _titleController,
                  decoration: inputDecoration('Prompt Name'),
                  style: inputTextStyle(),
                ))),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: titleText('Value')),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                    child: TextFormField(
                  controller: _valueController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 20,
                  minLines: 10,
                  decoration: inputDecoration('Value'),
                  style: inputTextStyle(),
                ))),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: primaryButtonStyle(),
                      onPressed: () async {
                        promptProviderNotifier.changeEditPrompt(
                            title: _titleController.text,
                            value: _valueController.text);
                        await promptProviderNotifier.registrationPrompt();
                        promptProviderNotifier.resetEditPrompt();
                        mainProviderNotifier.changePage('/prompt');
                      },
                      child: const Text('Save'),
                    ))),
          ])),
    );
  }
}
