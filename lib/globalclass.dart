import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Item {
  String name;
  Item(this.name);
}

class ItemWithUrl extends Item {
  String url;
  ItemWithUrl(String name, this.url) : super(name);
}

class ItemWithIcon extends Item {
  Widget icon;
  ItemWithIcon(String name, this.icon) : super(name);
}
