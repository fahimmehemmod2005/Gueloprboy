import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/app_text_styles.dart';

class WidgetHeader extends StatelessWidget {
  final String title;
  const WidgetHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            AppImages.leftArrow,
            height: 24.0.h,
            width: 24.0.w,
          ),
        ),
        const SizedBox(width: 103.0),
        Text(
          title,
          style: AppTextStyles.size16w600(color: AppColor.primaryTextColor),
        ),
      ],
    );
  }
}
