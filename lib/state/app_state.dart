import 'package:flutter/material.dart';
import 'package:prompt_manager/screen/home.dart';

class AppState {
  const AppState({
    this.pageIndex = 0,
    this.isConfigTableRow = false,
    this.userConfig = const UserConfigState(),
    this.currentContent = const Home(),
  });

  final int pageIndex;
  final bool isConfigTableRow;
  final UserConfigState userConfig;
  final Widget currentContent;

  AppState copyWith({
    int? pageIndex,
    bool? isConfigTableRow,
    UserConfigState? userConfig,
    Widget? currentContent,
  }) =>
      AppState(
        pageIndex: pageIndex ?? this.pageIndex,
        isConfigTableRow: isConfigTableRow ?? this.isConfigTableRow,
        userConfig: userConfig ?? this.userConfig,
        currentContent: currentContent ?? this.currentContent,
      );

  String get openAPIKey => userConfig.apikey;
}

class UserConfigState {
  const UserConfigState({this.apikey = ''});

  final String apikey;

  UserConfigState copyWith({String? apikey}) => UserConfigState(
        apikey: apikey ?? this.apikey,
      );
}
