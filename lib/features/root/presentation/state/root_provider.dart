import 'package:flutter/material.dart';

class RootProvider extends ChangeNotifier {
  int seletedPageIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  void selectPage(int index) {
    seletedPageIndex = index;
    pageController.animateToPage(seletedPageIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
    notifyListeners();
  }
}
