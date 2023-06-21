import 'package:flutter/material.dart';

import 'package:prompt_manager/screen/home.dart';
import 'package:prompt_manager/screen/prompt.dart';
import 'package:prompt_manager/screen/prompt_edit.dart';
import 'package:prompt_manager/screen/settings.dart';

class AppState {
  const AppState({this.pageIndex = 0, this.pageDetailIndex = 0});

  final int pageIndex;
  final int pageDetailIndex;

  AppState copyWith({int? pageIndex, int? pageDetailIndex}) => AppState(
        pageIndex: pageIndex ?? this.pageIndex,
        pageDetailIndex: pageDetailIndex ?? this.pageDetailIndex,
      );

  Widget getContent() {
    const List<Widget> pages = [Home(), Prompt(), Settings()];
    const List<Widget> detailPages = [PromptEdit()];

    if (pageDetailIndex == 0) {
      if (pages.length <= pageIndex) {
        return pages[0];
      }
    } else {
      if (pageDetailIndex == 2) {
        return PromptEdit();
      }
      return detailPages[pageDetailIndex - 1];
    }
    return pages[pageIndex];
  }
}
