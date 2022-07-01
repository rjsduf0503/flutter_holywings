import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Item {
  String name;
  Item(this.name);
}

class ItemWithUrl extends Item {
  String url;
  bool needsAuth;
  ItemWithUrl(String name, {this.needsAuth = false, required this.url})
      : super(name);
}

class ItemWithIcon extends Item {
  Widget icon;
  bool needsAuth;
  bool needsRouting;
  ItemWithIcon(String name,
      {this.needsRouting = true, this.needsAuth = false, required this.icon})
      : super(name);
}
