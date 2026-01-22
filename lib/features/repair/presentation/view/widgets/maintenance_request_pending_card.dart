import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_size_box.dart';
import '../../../../../core/constant/app_text_styles.dart';

class MaintenanceRequestPendingCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? room;
  final String? date;
  final String? status;
  final String? situation;
  const MaintenanceRequestPendingCard({
    super.key,
    this.image,
    this.title,
    this.room,
    this.date,
    this.status,
    this.situation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsGeometry.all(10),
      height: 106.0.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.borderColor),
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: Row(
        children: [
          Container(
            height: 74.0.h,
            width: 72.0.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0.r),
              image: DecorationImage(image: AssetImage(image ?? '')),
            ),
          ),
          AppSizeBox.width10,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: AppTextStyles.size16w500(
                    color: AppColor.primaryTextColor,
                  ),
                ),
                AppSizeBox.height10,
                Row(
                  children: [
                    Text(
                      room ?? '',
                      style: AppTextStyles.size14w500(
                        color: AppColor.subtitleColor,
                      ),
                    ),
                    AppSizeBox.width10,
                    Container(height: 10, width: 1, color: Colors.grey),
                    AppSizeBox.width10,
                    Text(
                      date ?? '',
                      style: AppTextStyles.size14w500(
                        color: AppColor.subtitleColor,
                      ),
                    ),
                  ],
                ),
                AppSizeBox.height10,
                Row(
                  children: [
                    Container(
                      height: 20.0.h,
                      width: 61.0.w,
                      decoration: BoxDecoration(
                        color: Color(0xffFCF1E6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          status ?? '',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ),
                    AppSizeBox.width10,
                    Container(
                      height: 20.0.h,
                      width: 78.0.w,
                      decoration: BoxDecoration(
                        color: Color(0xffFDEBEB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          situation ?? '',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
