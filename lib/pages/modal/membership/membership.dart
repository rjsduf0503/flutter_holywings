import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Membership extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Membership'),
        RaisedButton(
          onPressed: () {
            // 눌렀을 때 첫 번째 route로 되돌아 갑니다.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ],
    );
  }
}
