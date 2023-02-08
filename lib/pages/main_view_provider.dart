import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_key.dart';
import 'package:siabang_driver_app/pages/auth/login_page.dart';

class MainViewProvider extends ChangeNotifier {
  int currentPage = 0;

  void setPage(int page) {
    currentPage = page;
    notifyListeners();
  }
}
