import 'package:flutter/cupertino.dart';

class ResetPasswordViewModel extends ChangeNotifier{
  bool _isPasswordHidden = true;
  bool _isConfirmHidden = true;

  bool get isPasswordHidden => _isPasswordHidden;
  bool get isConfirmHidden => _isConfirmHidden;

  // track if form is valid
  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  void togglePassword() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  void toggleConfirm() {
    _isConfirmHidden = !_isConfirmHidden;
    notifyListeners();
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

  // Confirm Password Validator
  String? validateConfirmPassword(String? confirmPassword, String password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password is required';
    }
    if (confirmPassword != password) return 'Passwords do not match';
    return null;
  }

  // form validation check
  void validateForm(String password, String confirmPassword) {
    _isFormValid = password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        validatePassword(password) == null &&
        validateConfirmPassword(confirmPassword, password) == null;
    notifyListeners();
  }
}
