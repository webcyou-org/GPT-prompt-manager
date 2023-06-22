import 'package:flutter/material.dart';

import 'package:prompt_manager/screen/home.dart';
import 'package:prompt_manager/screen/prompt.dart';
import 'package:prompt_manager/screen/prompt_edit.dart';
import 'package:prompt_manager/screen/settings.dart';

import 'package:prompt_manager/db/database_helper.dart';

class AppState {
  const AppState(
      {this.pageIndex = 0,
      this.pageDetailIndex = 0,
      this.userConfig = const UserConfigState()});

  final int pageIndex;
  final int pageDetailIndex;
  final UserConfigState userConfig;
  // final DatabaseHelper dbHelper;

  AppState copyWith(
          {int? pageIndex,
          int? pageDetailIndex,
          UserConfigState? userConfig}) =>
      AppState(
        pageIndex: pageIndex ?? this.pageIndex,
        pageDetailIndex: pageDetailIndex ?? this.pageDetailIndex,
        userConfig: userConfig ?? this.userConfig,
      );

  Widget get selectedContent {
    const List<Widget> pages = [Home(), Prompt(), Settings()];
    const List<Widget> detailPages = [PromptEdit()];

    if (pageDetailIndex == 0) {
      if (pages.length <= pageIndex) {
        return pages[0];
      }
    } else {
      if (pageDetailIndex == 2) {
        return const PromptEdit();
      }
      return detailPages[pageDetailIndex - 1];
    }
    return pages[pageIndex];
  }
}

class UserConfigState {
  const UserConfigState({this.apikey = ''});

  final String apikey;

  UserConfigState copyWith({String? apikey}) => UserConfigState(
        apikey: apikey ?? this.apikey,
      );
}
