import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_text_styles.dart';

class WidgetCountryPickerField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? Function(PhoneNumber?)? validator;

  const WidgetCountryPickerField({
    super.key,
    required this.hintText,
    required this.label,
    this.controller,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.size14w500(color: AppColor.titleColor),
        ),
        const SizedBox(height: 10),
        IntlPhoneField(
          initialCountryCode: 'BD',
          showCountryFlag: false,
          cursorColor: Colors.black,
          style: AppTextStyles.size14w400(color: AppColor.primaryTextColor),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
