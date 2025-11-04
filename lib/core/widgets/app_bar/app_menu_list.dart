import 'package:flutter/material.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/core/routes/routes.dart';

class AppMenuList {
  static List<AppMenu> getItems(BuildContext context) {
    return [
      AppMenu(title: context.texts.home, path: Routes.home),
      AppMenu(title: context.texts.aboutMe, path: Routes.aboutMe),
    ];
  }
}

class AppMenu {
  final String title;
  final String path;

  AppMenu({required this.title, required this.path});
}
