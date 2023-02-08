import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_key.dart';

Future nextScreen(page) async {
  return await Navigator.push(NavKey.navKey.currentState!.context,
      MaterialPageRoute(builder: (context) => page));
}

void backScreen([dynamic value]) {
  Navigator.pop(NavKey.navKey.currentState!.context, value);
}

Future backScreenUntil() async {
  return Navigator.popUntil(
      NavKey.navKey.currentState!.context, (route) => route.isFirst);
}

void nextScreeniOS(page) {
  Navigator.push(NavKey.navKey.currentState!.context,
      CupertinoPageRoute(builder: (context) => page));
}

void nextScreenReplace(page) {
  Navigator.pushReplacement(NavKey.navKey.currentState!.context,
      MaterialPageRoute(builder: (context) => page));
}

void nextScreenPopup(page) {
  Navigator.push(
    NavKey.navKey.currentState!.context,
    MaterialPageRoute(fullscreenDialog: true, builder: (context) => page),
  );
}

void nextScreenRemoveUntil(page) {
  Navigator.pushAndRemoveUntil(NavKey.navKey.currentState!.context,
      MaterialPageRoute(builder: (context) => page), (route) => false);
}
