import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_size_box.dart';
import '../../../../../core/constant/app_text_styles.dart';

class NotificationCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? time;
  final String? icon;
  const NotificationCard({
    super.key,
    this.title,
    this.subTitle,
    this.icon,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 124.0.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.borderColor),
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 32.0.h,
              width: 32.0.h,
              decoration: BoxDecoration(
                color: AppColor.bandColor,
                borderRadius: BorderRadius.circular(8.0.r),
              ),
              child: Center(
                child: Image.asset(
                  icon ?? '',
                  color: Colors.orange,
                  height: 20.0.h,
                  width: 20.0.w,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(),
                ),
              ),
            ),
            AppSizeBox.width10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: AppTextStyles.size16w500(
                      color: AppColor.primaryTextColor,
                    ),
                  ),
                  AppSizeBox.height5,
                  Text(
                    subTitle ?? '',
                    style: AppTextStyles.size14w500(
                      color: AppColor.primaryTextColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppSizeBox.height10,
                  Text(
                    time ?? '',
                    style: AppTextStyles.size14w500(color: AppColor.iconColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}