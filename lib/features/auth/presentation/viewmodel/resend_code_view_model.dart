import 'dart:async';
import 'package:flutter/cupertino.dart';

class ResendCodeViewModel extends ChangeNotifier{
  int _secondsRemaining = 0;
  bool _isResendAvailable = true;
  Timer? _timer;

  int get secondsRemaining => _secondsRemaining;
  bool get isResendAvailable => _isResendAvailable;

  void startTimer() {
    _isResendAvailable = false;
    _secondsRemaining = 30;
    notifyListeners();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        _isResendAvailable = true;
        notifyListeners();
      } else {
        _secondsRemaining--;
        notifyListeners();
      }
    });
  }

  void onResend() {
    debugPrint("Resend OTP tapped");
    startTimer();
  }

  String formatTime() {
    final minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final secs = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}