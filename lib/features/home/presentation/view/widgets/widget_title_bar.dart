import 'package:flutter/material.dart';

import '../../../../../core/constant/app_text_styles.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final Color? textColor;
  const TitleBar({
    super.key,
    required this.title,
    required this.onTap,
    required this.subTitle,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      titleTextStyle: AppTextStyles.size16w600(color: textColor ?? Colors.white),
      trailing: GestureDetector(
        onTap: onTap,
        child: Text(
          subTitle,
          style: AppTextStyles.size14w500(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
