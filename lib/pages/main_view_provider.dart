import 'package:flutter/material.dart';

class MainViewProvider extends ChangeNotifier {
  int currentPage = 0;

  void setPage(int page) {
    currentPage = page;
    notifyListeners();
  }
}
