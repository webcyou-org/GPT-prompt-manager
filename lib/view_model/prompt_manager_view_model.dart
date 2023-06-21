import 'package:prompt_manager/state/prompt_manager_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromptManagerStateNotifier extends StateNotifier<PromptManagerState> {
  PromptManagerStateNotifier() : super(const PromptManagerState());

  void reBuild() {
    state = const PromptManagerState();
  }

  void selectPrompt({required id, required title, required value}) {
    final selectedPrompt =
        state.selectedPrompt.copyWith(id: id, title: title, value: value);
    state = state.copyWith(selectedPrompt: selectedPrompt);
  }
}
