import 'package:flutter/material.dart';
import 'package:prompt_manager/screen/home.dart';
import 'package:prompt_manager/screen/prompt.dart';
import 'package:prompt_manager/screen/prompt_edit.dart';
import 'package:prompt_manager/screen/settings.dart';

class AppState {
  const AppState(
      {this.pageIndex = 0,
      this.pageDetailIndex = 0,
      this.isConfigTableRow = false,
      this.userConfig = const UserConfigState()});

  final int pageIndex;
  final int pageDetailIndex;
  final bool isConfigTableRow;
  final UserConfigState userConfig;

  AppState copyWith(
          {int? pageIndex,
          int? pageDetailIndex,
          bool? isConfigTableRow,
          UserConfigState? userConfig}) =>
      AppState(
        pageIndex: pageIndex ?? this.pageIndex,
        pageDetailIndex: pageDetailIndex ?? this.pageDetailIndex,
        isConfigTableRow: isConfigTableRow ?? this.isConfigTableRow,
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

  String get openAPIKey => userConfig.apikey;
}

class UserConfigState {
  const UserConfigState({this.apikey = ''});

  final String apikey;

  UserConfigState copyWith({String? apikey}) => UserConfigState(
        apikey: apikey ?? this.apikey,
      );
}
