import 'package:flutter/material.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_text_styles.dart';

class WidgetTitleSubtitle extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const WidgetTitleSubtitle({
    super.key, this.title, this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title??'',
          style: AppTextStyles.size24w600(
            color: AppColor.titleColor,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          subTitle??'',
          style: AppTextStyles.size14w400(
            color: AppColor.subtitleColor,
          ),
        ),
      ],
    );
  }
}