import 'package:prompt_manager/state/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/utils/const.dart';
import 'package:prompt_manager/db/database_helper.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(const AppState());

  final dbHelper = DatabaseHelper.instance;

  void reBuild() {
    state = const AppState();
  }

  void changePage({pageIndex = 0, pageDetailIndex = 0}) {
    state =
        state.copyWith(pageIndex: pageIndex, pageDetailIndex: pageDetailIndex);
  }

  void setApikey(String apikey) {
    final userConfig = state.userConfig.copyWith(apikey: apikey);
    state = state.copyWith(userConfig: userConfig);
  }

  void setIsConfigTableRow(bool isConfigTableRow) {
    state = state.copyWith(isConfigTableRow: isConfigTableRow);
  }

  void registrationOpenApiKey(String apikey) async {
    Map<String, dynamic> row = {};
    if (state.isConfigTableRow) {
      row = {DatabaseHelper.columnId: 1, 'apikey': apikey};
      await dbHelper.update(userTableName, row);
      setIsConfigTableRow(true);
    } else {
      row = {'apikey': apikey};
      await dbHelper.insert(userTableName, row);
    }
    setApikey(apikey);
  }
}
