// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../globalfunction.dart' as _gf;
import '../../globalclass.dart' as _gc;
import '../../pages/modal/stackrouting.dart' as _routing;

class Item {
  String url, name;
  Item({required this.url, required this.name});
}

class GridViewComponent extends StatefulWidget {
  const GridViewComponent({Key? key}) : super(key: key);

  @override
  _GridViewComponentState createState() => _GridViewComponentState();
}

class _GridViewComponentState extends State<GridViewComponent> {
  List<_gc.ItemWithUrl> itemList = [
    _gc.ItemWithUrl("Reservation", "assets/table.png"),
    _gc.ItemWithUrl("Outlet", "assets/outlet.png"),
    _gc.ItemWithUrl("My Bottles", "assets/bottle.png"),
    _gc.ItemWithUrl("What's On", "assets/board.png"),
    _gc.ItemWithUrl("Holy Chest", "assets/chest.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(30),
      crossAxisSpacing: 30,
      // mainAxisSpacing: 5,
      crossAxisCount: 3,
      shrinkWrap: true,
      children: itemList.asMap().entries.map((item) {
        return InkWell(
          onTap: (() {
            _gf.handleGridClick(context, item.value.name);
          }),
          child: Column(
            children: [
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Image.asset(
                  item.value.url,
                  fit: BoxFit.contain,
                  width: 48,
                  height: 48,
                ),
              ),
              Text(item.value.name, style: TextStyle(fontSize: 12)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
