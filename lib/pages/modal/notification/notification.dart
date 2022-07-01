import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../globalclass.dart' as _gc;

class Notification extends StatelessWidget {
  List<_gc.NotificationItem> notificationList = [
    _gc.NotificationItem(Icon(Icons.campaign, color: Colors.orange[200]),
        "News", "News1", "Content1"),
    _gc.NotificationItem(Icon(Icons.campaign, color: Colors.orange[200]),
        "News", "News2", "Content2"),
    _gc.NotificationItem(Icon(Icons.campaign, color: Colors.orange[200]),
        "News", "News3", "Content3"),
    _gc.NotificationItem(Icon(Icons.campaign, color: Colors.orange[200]),
        "News", "News4", "Content4"),
    _gc.NotificationItem(Icon(Icons.local_offer, color: Colors.orange[200]),
        "Promo", "Promo1", "Content1"),
    _gc.NotificationItem(Icon(Icons.local_offer, color: Colors.orange[200]),
        "Promo", "Promo2", "Content2"),
    _gc.NotificationItem(Icon(Icons.local_offer, color: Colors.orange[200]),
        "Promo", "Promo3", "Content3"),
    _gc.NotificationItem(Icon(Icons.local_offer, color: Colors.orange[200]),
        "Promo", "Promo4", "Content4"),
    _gc.NotificationItem(Icon(Icons.festival, color: Colors.orange[200]),
        "Event", "Event1", "Content1"),
    _gc.NotificationItem(Icon(Icons.festival, color: Colors.orange[200]),
        "Event", "Event2", "Content2"),
    _gc.NotificationItem(Icon(Icons.festival, color: Colors.orange[200]),
        "Event", "Event3", "Content3"),
    _gc.NotificationItem(Icon(Icons.festival, color: Colors.orange[200]),
        "Event", "Event4", "Content4"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _gc.CustomListViewBuilder(notificationList),
      ],
    );
  }
}
