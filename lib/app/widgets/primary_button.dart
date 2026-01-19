import 'package:flutter/material.dart';
import '../../core/constant/app_color.dart';
import '../../core/constant/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final String label;
  const PrimaryButton({
    super.key,
    this.height = 48,
    this.width = double.infinity,
    this.backgroundColor = AppColor.primaryColor,
    this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
            label,
            style: AppTextStyles.size16w500(color: Colors.white)
        ),
      ),
    );
  }
}