import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/core/constant/app_text_styles.dart';

class ResendButton extends StatefulWidget {
  const ResendButton({super.key});

  @override
  State<ResendButton> createState() => _ResendButtonState();
}

class _ResendButtonState extends State<ResendButton> {
  int _secondsRemaining = 0;
  bool _isResendAvailable = true;
  Timer? _timer;

  void _startTimer() {
    setState(() {
      _isResendAvailable = false;
      _secondsRemaining = 30;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        setState(() {
          _isResendAvailable = true;
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _onResend() {
    print("Resend OTP tapped");
    _startTimer();

  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: "Didn’t receive the code? ",
          style: AppTextStyles.size14w400(color: AppColor.subtitleColor),
          children: [
            _isResendAvailable
                ? TextSpan(
              text: "Resend Code",
              style: AppTextStyles.size14w400(color: AppColor.primaryColor),
              recognizer: TapGestureRecognizer()..onTap = _onResend,
            )
                : TextSpan(
              style: AppTextStyles.size14w400(color: AppColor.primaryColor),
              text: " ${_formatTime(_secondsRemaining)}",
            ),
          ],
        ),
      ),
    );
  }
}