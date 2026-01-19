import 'package:flutter/material.dart';

class ForgotViewModel extends ChangeNotifier {

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  void validateForm(String email) {
    _isFormValid =
        email.trim().isNotEmpty && validateEmail(email) == null;
    notifyListeners();
  }

  // Email Validator
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) return 'Enter a valid email';
    return null;
  }
}
