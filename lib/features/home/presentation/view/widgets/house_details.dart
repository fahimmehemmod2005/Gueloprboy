import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/app_size_box.dart';
import '../../../../../core/constant/app_text_styles.dart';

class HouseDetails extends StatelessWidget {
  final String houseImage;
  const HouseDetails({
    super.key, required this.houseImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 305.0.h,
      width: 304.0.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 185.0.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0)
            ),
            child: Image.asset(
              houseImage,
              fit: BoxFit.cover,
            ),
          ),
          AppSizeBox.height10,
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                Container(
                  height: 28.0.h,
                  width: 90.0.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.borderColor,),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.bed),
                      const SizedBox(width: 8.0),
                      Text('2 Beds',style: AppTextStyles.size14w500(color: AppColor.iconColor),),
                    ],
                  ),
                ),
                Container(
                  height: 28.0.h,
                  width: 94.0.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.borderColor,),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.bathtub),
                      const SizedBox(width: 8.0),
                      Text('2 Baths',style: AppTextStyles.size14w500(color: AppColor.iconColor),),
                    ],
                  ),
                ),
                Container(
                  height: 28.0.h,
                  width: 104.0.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.borderColor,),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.fitTo),
                      const SizedBox(width: 8.0),
                      Text('950 sq ft',style: AppTextStyles.size14w500(color: AppColor.iconColor),),
                    ],
                  ),
                ),
                Container(
                  height: 28.0.h,
                  width: 95.0.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.borderColor,),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.floor),
                      const SizedBox(width: 8.0),
                      Text('12 Floor',style: AppTextStyles.size14w500(color: AppColor.iconColor),),
                    ],
                  ),
                ),
                Container(
                  height: 28.0.h,
                  width: 81.0.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.borderColor,),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.house),
                      const SizedBox(width: 8.0),
                      Text('1 Year',style: AppTextStyles.size14w500(color: AppColor.iconColor),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppSizeBox.height10,
          Text('Elm Apartment \$ 3,000',style: AppTextStyles.size16w500(color: AppColor.titleColor),),
          Text('1234 Elm Street, New York, NY 10001',style: AppTextStyles.size14w500(color: AppColor.iconColor),),
        ],
      ),
    );
  }
}