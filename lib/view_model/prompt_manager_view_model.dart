import 'package:prompt_manager/state/prompt_manager_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prompt_manager/utils/const.dart';
import 'package:prompt_manager/db/database_helper.dart';

class PromptManagerStateNotifier extends StateNotifier<PromptManagerState> {
  PromptManagerStateNotifier()
      : super(const PromptManagerState(promptList: []));

  final dbHelper = DatabaseHelper.instance;

  void reBuild() {
    state = const PromptManagerState(promptList: []);
  }

  void selectPrompt({required id, required title, required value}) {
    final selectedPrompt =
        state.selectedPrompt.copyWith(id: id, title: title, value: value);
    state = state.copyWith(selectedPrompt: selectedPrompt);
  }

  void setPromptList(promptList) {
    state = state.copyWith(promptList: promptList);
  }

  void changeEditPrompt({required title, required value}) {
    final editPrompt = state.editPrompt.copyWith(title: title, value: value);
    state = state.copyWith(editPrompt: editPrompt);
  }

  void resetEditPrompt() {
    final editPrompt = state.editPrompt.copyWith(id: 0, title: '', value: '');
    state = state.copyWith(editPrompt: editPrompt);
  }

  Future<void> registrationPrompt() async {
    if (isEditPrompt) {
      await editPrompt();
    } else {
      await createPrompt();
    }
    final promptList = await dbHelper.promptList;
    setPromptList(promptList);
  }

  Future<void> createPrompt() async {
    Map<String, dynamic> row = {
      'title': state.editPrompt.title,
      'value': state.editPrompt.value,
    };
    await dbHelper.insert(promptsTableName, row);
  }

  Future<void> editPrompt() async {
    Map<String, dynamic> row = {
      '_id': state.editPrompt.id,
      'title': state.editPrompt.title,
      'value': state.editPrompt.value,
    };
    await dbHelper.update(promptsTableName, row);
  }

  bool get isEditPrompt => state.editPrompt.id != 0;
}
