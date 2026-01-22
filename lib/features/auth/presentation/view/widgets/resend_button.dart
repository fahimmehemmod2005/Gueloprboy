import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gueloprboy/features/auth/presentation/viewmodel/resend_code_view_model.dart';
import 'package:provider/provider.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/core/constant/app_text_styles.dart';

class ResendButton extends StatelessWidget {
  const ResendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResendCodeViewModel>(
      builder: (context, resend, child) {
        return Center(
          child: Text.rich(
            TextSpan(
              text: "Didn’t receive the code? ",
              style: AppTextStyles.size14w400(
                color: AppColor.subtitleColor,
              ),
              children: [
                resend.isResendAvailable
                    ? TextSpan(
                  text: "Resend Code",
                  style: AppTextStyles.size14w400(
                    color: AppColor.primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = resend.onResend,
                )
                    : TextSpan(
                  text: " ${resend.formatTime()}",
                  style: AppTextStyles.size14w400(
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
