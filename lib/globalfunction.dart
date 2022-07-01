import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
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

void handleRouting(context, item,
    [bool needsAuth = false, bool needsRouting = true]) {
  if (!needsRouting) {
    handleOtherListViewClick(item);
  } else {
    return needsAuth
        ? showLoginBottomSheet(context)
        : Navigator.of(context).push(_createRoute(item));
  }
}

void handleOtherListViewClick(item) {
  switch (item) {
    case "Contact Us":
      customLaunch(Uri.parse('tel://+1 555 010 999'));
      return;
    case "Help":
      customLaunch(
          Uri.parse('https://apps-20083.firebaseapp.com/pages/faq.html'));
      return;
    case "Rate Holywings App":
      print(Platform.isIOS);
      if (Platform.isIOS) {
        customLaunch(
            Uri.parse('https://apps.apple.com/kr/app/holywings/id1477590019'));
      } else if (Platform.isAndroid) {
        customLaunch(Uri.parse(
            'http://play.google.com/store/apps/details?id=holywings.id.android'));
      }
      return;
    default:
      return;
  }
}

Future<void> customLaunch(url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print('could not launch $url');
  }
}
