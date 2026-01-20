import 'package:flutter/material.dart';

class VerificationViewModel extends ChangeNotifier {

  bool _isOtpValid = false;
  bool get isOtpValid => _isOtpValid;

  void validateOtp(String otp) {
    _isOtpValid = otp.length == 5;
    notifyListeners();
  }

  String? otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    } else if (value.length < 5) {
      return 'Enter 5 digit code';
    }
    return null;
  }
}
