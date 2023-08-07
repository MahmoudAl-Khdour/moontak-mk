import 'package:flutter/material.dart';

class PagesModel {
  String pageName;
  Widget widget;
  Pages page;

  PagesModel({
    required this.pageName,
    required this.widget,
    required this.page,
  });
}

enum Pages {
  profile,
  accounts,
  dashboard,
  funds,
  platform,
}
