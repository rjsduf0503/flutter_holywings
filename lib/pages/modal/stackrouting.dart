import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './reservation/reservation.dart';
import './outlet/outlet.dart';
import './whatson/whatson.dart';
import './notification/notification.dart' as _Notification;
import './membership/membership.dart';
import './setting/setting.dart';

// class Params {
//   final String name;
//   // final String description;

//   // Todo(this.title, this.description);
//   Params(this.name);
// }

class StackRouting extends StatelessWidget {
  final String item;

  const StackRouting(this.item, {Key? key}) : super(key: key);

  Widget getStackBody() {
    switch (item) {
      case "Reservation":
        return Reservation();
      case "Outlet":
        return Outlet();
      case "What's On":
        return WhatsOn();
      case "Notification":
        return _Notification.Notification();
      case "Membership Benefit":
        return Membership();
      case "Setting":
        return Setting();
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item),
      ),
      body: getStackBody(),
    );
  }
}
