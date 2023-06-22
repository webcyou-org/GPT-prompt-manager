import 'package:prompt_manager/state/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  void setApikey({required apikey}) {
    final userConfig = state.userConfig.copyWith(apikey: apikey);
    state = state.copyWith(userConfig: userConfig);
  }
}
