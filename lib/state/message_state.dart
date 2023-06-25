class MessageManager {
  const MessageManager({
    required this.messageList,
  });

  final List<MessageState> messageList;

  MessageManager copyWith({List<MessageState>? messageList}) => MessageManager(
        messageList: messageList ?? this.messageList,
      );
}

class MessageState {
  const MessageState({
    this.text = '',
    this.isChatGPT = false,
  });

  final String text;
  final bool isChatGPT;

  MessageState copyWith({String? text, bool? isChatGPT}) => MessageState(
        text: text ?? this.text,
        isChatGPT: isChatGPT ?? this.isChatGPT,
      );
}
