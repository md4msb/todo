import 'package:flutter/material.dart';
import 'package:todo/model/drawer_item.dart';

class DrawerItems {
  static final template =
      DrawerItem(title: "Template", icon: Icons.bookmark_border_rounded);
  static final categories =
      DrawerItem(title: "Categories", icon: Icons.category_outlined);
  static final analytics =
      DrawerItem(title: "Analytics", icon: Icons.analytics_outlined);
  static final settings =
      DrawerItem(title: "Settings", icon: Icons.settings_outlined);

 static final List<DrawerItem> allItems = [template,categories,analytics,settings];

}
