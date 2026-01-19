import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/core/constant/app_text_styles.dart';

class CustomRichText extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final void Function()? text2Tap;
  final void Function()? text4Tap;

  const CustomRichText({
    super.key,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.text2Tap,
    this.text4Tap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: text1,
              style: AppTextStyles.size14w400(color: AppColor.subtitleColor)
          ),
          TextSpan(
            text: text2,
            style: AppTextStyles.size14w400(color: AppColor.primaryColor),
            recognizer: TapGestureRecognizer()..onTap = text2Tap,
          ),
          TextSpan(
              text: text3,
              style: AppTextStyles.size14w400(color: AppColor.subtitleColor),
          ),
          TextSpan(
            text: text4,
            style: AppTextStyles.size14w400(color: AppColor.primaryColor),
            recognizer: TapGestureRecognizer()..onTap = text4Tap,
          ),
        ],
      ),
    );
  }
}
