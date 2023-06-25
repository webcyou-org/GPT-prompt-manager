class PromptManagerState {
  const PromptManagerState({
    this.selectedPrompt = const PromptState(id: 0, title: '', value: ''),
    this.editPrompt = const PromptState(id: 0, title: '', value: ''),
    required this.promptList,
  });

  final PromptState selectedPrompt;
  final PromptState editPrompt;
  final List<PromptState> promptList;

  PromptManagerState copyWith(
          {PromptState? selectedPrompt,
          PromptState? editPrompt,
          List<PromptState>? promptList}) =>
      PromptManagerState(
        selectedPrompt: selectedPrompt ?? this.selectedPrompt,
        editPrompt: editPrompt ?? this.editPrompt,
        promptList: promptList ?? this.promptList,
      );
}

class PromptState {
  const PromptState(
      {required this.id, required this.title, required this.value});

  final int id;
  final String title;
  final String value;

  PromptState copyWith({int? id, String? title, String? value}) {
    return PromptState(
      id: id ?? this.id,
      title: title ?? this.title,
      value: value ?? this.value,
    );
  }

  static PromptState fromJson(Map<String, dynamic> json) {
    return PromptState(
        id: json['_id'] ?? 0,
        title: json['title'] ?? '',
        value: json['value'] ?? '');
  }
}
