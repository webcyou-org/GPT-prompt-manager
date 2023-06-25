import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/main.dart';
import 'package:prompt_manager/utils/const.dart';

class HomeTextFormField extends ConsumerStatefulWidget {
  const HomeTextFormField({Key? key}) : super(key: key);

  @override
  HomeTextFormFieldState createState() => HomeTextFormFieldState();
}

class HomeTextFormFieldState extends ConsumerState<HomeTextFormField> {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final messageManagerNotifier = ref.read(messageManagerProvider.notifier);
    final openAPIKey = ref.watch(appProvider).openAPIKey;

    return TextFormField(
      controller: _messageController,
      keyboardType: TextInputType.multiline,
      maxLines: 6,
      minLines: 1,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () async {
              final selectedPrompt =
                  ref.read(promptManagerProvider).selectedPrompt;
              final sendMessage =
                  "${selectedPrompt.value}\n${_messageController.text}";
              messageManagerNotifier.addMessage(sendMessage, false);
              _messageController.text = '';
              messageManagerNotifier.sendMessage(sendMessage, openAPIKey);
            }),
        border: inputBorder(),
        labelText: 'Send message.',
        fillColor: Colors.white,
        filled: true,
      ),
      style: inputTextStyle(),
    );
  }
}
