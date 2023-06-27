import 'package:flutter/material.dart';
import 'package:prompt_manager/screen/home.dart';
import 'package:prompt_manager/screen/prompt.dart';
import 'package:prompt_manager/screen/prompt_edit.dart';
import 'package:prompt_manager/screen/settings.dart';

class Route {
  final int pageIndex;
  final Widget widget;

  const Route({required this.pageIndex, required this.widget});
}

const Map<String, Route> routes = {
  '/': Route(pageIndex: 0, widget: Home()),
  '/home': Route(pageIndex: 0, widget: Home()),
  '/prompt': Route(pageIndex: 1, widget: Prompt()),
  '/prompt/edit': Route(pageIndex: 1, widget: PromptEdit()),
  '/prompt/new': Route(pageIndex: 1, widget: PromptEdit()),
  '/settings': Route(pageIndex: 2, widget: Settings()),
};

Route getRouteByPageIndex(int index) {
  for (final route in routes.entries) {
    if (route.value.pageIndex == index) {
      return route.value;
    }
  }
  return const Route(pageIndex: 0, widget: Home());
}

Route getRouteByPath(String path) {
  return routes[path] ?? const Route(pageIndex: 0, widget: Home());
}
