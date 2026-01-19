import 'package:flutter/cupertino.dart';

class OnboardingViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  bool get isLast => _currentIndex == pages.length - 1;

  void next() {
    if (_currentIndex < pages.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  var pages = [
    {
      "title": "Join us and Unlock a World of Possibilities",
      "subtitle":
          "Create an account to begin your journey, or log in if you already have one..",
    },
    {
      "title": "Find Your Dream Home",
      "subtitle": "Explore thousands of modern and smart houses.",
    },
    {
      "title": "Fast, Easy & Secure",
      "subtitle": "Let’s get started and enjoy the experience.",
    },
  ];
}
