import 'package:prompt_manager/state/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/utils/const.dart';
import 'package:prompt_manager/db/database_helper.dart';
import 'package:prompt_manager/utils/routes.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(const AppState());

  final dbHelper = DatabaseHelper.instance;

  void reBuild() {
    state = const AppState();
  }

  void changePageIndex(int pageIndex) {
    final route = getRouteByPageIndex(pageIndex);
    state = state.copyWith(pageIndex: pageIndex, currentContent: route.widget);
  }

  void changePage(String path) {
    final route = getRouteByPath(path);
    state = state.copyWith(
        pageIndex: route.pageIndex, currentContent: route.widget);
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
