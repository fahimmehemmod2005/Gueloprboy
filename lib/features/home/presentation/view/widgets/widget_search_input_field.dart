import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/app_text_styles.dart';

class SearchInputField extends StatelessWidget {
  final void Function()? onTap;
  const SearchInputField({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: AppTextStyles.size14w400(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Image.asset(AppImages.search),
        suffixIcon: GestureDetector(
          onTap: onTap,
            child: Image.asset(AppImages.filter),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Search here...',
        hintStyle: AppTextStyles.size14w400(color: AppColor.iconColor),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
      ),
    );
  }
}