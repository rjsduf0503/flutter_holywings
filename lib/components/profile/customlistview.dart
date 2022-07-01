import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import '../../pages/profile/profile.dart';
import '../../globalclass.dart' as _gc;
import '../../globalfunction.dart' as _gf;

class CustomListView extends StatelessWidget {
  List<_gc.ItemWithIcon> _list;

  CustomListView(this._list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[800],
      ),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: _list.asMap().entries.map((item) {
          return ListTile(
            leading: item.value.icon,
            title: Text(item.value.name),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange[200]),
            onTap: (() {
              _gf.handleRouting(context, item.value.name, item.value.needsAuth,
                  item.value.needsRouting);
            }),
          );
        }).toList(),
      ),
    );
  }
}
