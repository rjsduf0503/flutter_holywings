// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../globalfunction.dart' as _gf;

class UserInfoComponent extends StatefulWidget {
  const UserInfoComponent({Key? key}) : super(key: key);

  @override
  _UserInfoComponentState createState() => _UserInfoComponentState();
}

class _UserInfoComponentState extends State<UserInfoComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        _gf.showLoginBottomSheet(context);
      }),
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 8, 12, 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey[800],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 6),
              child: Icon(Icons.person_pin_rounded),
            ),
            Flexible(
              child: Text(
                'Login to see voucher and point information',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
