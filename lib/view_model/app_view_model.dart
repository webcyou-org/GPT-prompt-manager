import 'package:prompt_manager/state/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(const AppState());

  void reBuild() {
    state = const AppState();
  }

  void changePage({pageIndex = 0, pageDetailIndex = 0}) {
    state =
        state.copyWith(pageIndex: pageIndex, pageDetailIndex: pageDetailIndex);
  }
}
