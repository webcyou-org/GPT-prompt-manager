import 'dart:convert' as convert;
import 'package:prompt_manager/state/message_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prompt_manager/utils/http_helper.dart';

class MessageStateNotifier extends StateNotifier<MessageManager> {
  MessageStateNotifier() : super(const MessageManager(messageList: []));

  void reBuild() {
    state = const MessageManager(messageList: []);
  }

  void addMessage(String message, bool isChatGPT) {
    state = state.copyWith(messageList: [
      ...state.messageList,
      MessageState(text: message, isChatGPT: isChatGPT)
    ]);
  }

  void sendMessage(String message, String openAPIKey) async {
    if (message.isEmpty || openAPIKey.isEmpty) return;

    var result = await callOpenAPI(message, openAPIKey);
    Map<String, dynamic> resultMap =
        convert.json.decode(result) as Map<String, dynamic>;
    addMessage(resultMap['choices'][0]['text'], true);
  }
}
