import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

class SignupViewModel extends ChangeNotifier {
  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;

  bool _isTermsChecked = false;
  bool get isTermsChecked => _isTermsChecked;

  void togglePassword() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  void toggleTerms(bool? value) {
    _isTermsChecked = value ?? false;
    notifyListeners();
  }

  // Validation functions
  String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) return 'Name is required';
    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) return 'Enter a valid email';
    return null;
  }

  String? validatePhone(PhoneNumber? phone) {
    if (phone == null || phone.number.trim().isEmpty) return 'Phone is required';
    if (phone.number.length < 8) return 'Enter a valid phone number';
    return null;
  }

  // Helper for reactive button enable (string input)
  String? validatePhoneString(String? phone) {
    if (phone == null || phone.trim().isEmpty) return 'Phone is required';
    if (phone.trim().length < 8) return 'Enter a valid phone number';
    return null;
  }

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

  // Form validation checker
  void validateForm({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    final isFieldsValid = validateName(name) == null &&
        validateEmail(email) == null &&
        phone.trim().isNotEmpty &&
        validatePassword(password) == null;
    _isFormValid = isFieldsValid && _isTermsChecked;
    notifyListeners();
  }
}
