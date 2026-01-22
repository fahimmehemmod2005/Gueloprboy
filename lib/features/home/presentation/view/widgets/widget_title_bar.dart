import 'package:flutter/material.dart';

import '../../../../../core/constant/app_text_styles.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final String subTitle;
  final void Function()? onTap;
  final Color? textColor1;
  final Color? textColor2;
  const TitleBar({
    super.key,
    required this.title,
    this.onTap,
    required this.subTitle,
    this.textColor1,
    this.textColor2,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      titleTextStyle: AppTextStyles.size16w600(color: textColor1 ?? Colors.white),
      trailing: GestureDetector(
        onTap: onTap,
        child: Text(
          subTitle,
          style: AppTextStyles.size14w500(color: textColor2 ?? Colors.white),
        ),
      ),
    );
  }
}
