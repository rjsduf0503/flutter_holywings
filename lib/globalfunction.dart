import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './components/auth/login/login.dart' as _login;
import '../../pages/modal/stackrouting.dart' as _routing;

void showLoginBottomSheet(parentContext) {
  showModalBottomSheet<void>(
    context: parentContext,
    isScrollControlled: true,
    enableDrag: false,
    builder: (BuildContext context) {
      return _login.Login();
    },
  );
}

Route _createRoute(item) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        _routing.StackRouting(item),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var curveTween = CurveTween(curve: curve);

      var tween = Tween(begin: begin, end: end).chain(curveTween);

      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

void handleGridClick(context, item) {
  switch (item) {
    case "My Bottles":
      return showLoginBottomSheet(context);
    case "Holy Chest":
      return showLoginBottomSheet(context);
    default:
      Navigator.of(context).push(_createRoute(item));
  }
}

void handleBadgeClick(context, item) {
  switch (item) {
    default:
      Navigator.of(context).push(_createRoute(item));
  }
}
