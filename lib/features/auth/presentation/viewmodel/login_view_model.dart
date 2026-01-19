import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isPasswordHidden = true;
  bool _isChecked = false;
  bool _isFormValid = false;

  bool get isPasswordHidden => _isPasswordHidden;
  bool get isChecked => _isChecked;
  bool get isFormValid => _isFormValid;

  void togglePassword() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  void toggleChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  // Check if both fields are filled
  void validateForm(String email, String password) {
    _isFormValid = email.trim().isNotEmpty && password.trim().isNotEmpty;
    notifyListeners();
  }

  // Email Validator
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) return 'Enter a valid email';
    return null;
  }

  // Password Validator
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) return 'Password is required';
    if (password.length < 8) return 'Password must be at least 8 characters';
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasNumber = password.contains(RegExp(r'\d'));
    final hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (!hasUppercase) return 'Must contain at least one uppercase letter';
    if (!hasLowercase) return 'Must contain at least one lowercase letter';
    if (!hasNumber) return 'Must contain at least one number';
    if (!hasSpecial) return 'Must contain at least one special character';
    return null;
  }
}