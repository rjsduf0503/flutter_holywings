// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../globalfunction.dart' as _gf;

class OutletComponent extends StatefulWidget {
  const OutletComponent({Key? key}) : super(key: key);

  @override
  _OutletComponentState createState() => _OutletComponentState();
}

class _OutletComponentState extends State<OutletComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              'My Favorite Outlets',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        InkWell(
          onTap: (() {
            _gf.handleRouting(context, 'Outlet');
          }),
          child: Container(
            margin: EdgeInsets.fromLTRB(12, 8, 12, 8),
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[800],
            ),
            child: Text(
                'Your favorite outlets will be shown here. Add some for easier access to reservations and more.⭐️',
                style: TextStyle(fontSize: 12)),
          ),
        ),
      ],
    );
  }
}
