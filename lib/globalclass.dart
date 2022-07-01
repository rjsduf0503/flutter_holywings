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

class NotificationItem {
  Widget icon;
  String type, title, content;
  NotificationItem(this.icon, this.type, this.title, this.content);
}

class CustomListViewBuilder extends StatelessWidget {
  List<NotificationItem> _list;

  CustomListViewBuilder(this._list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(8),
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              height: double.infinity,
              child: _list[index].icon,
            ),
            title: Text(_list[index].type),
            subtitle: Text(_list[index].title + '\n' + _list[index].content),
            isThreeLine: true,
            onTap: (() {
              print(_list[index].content);
            }),
          );
        },
      ),
    );
  }
}
