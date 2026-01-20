import 'package:flutter/material.dart';
import 'package:gueloprboy/app/routes/route_name.dart';
import 'package:gueloprboy/app/widgets/primary_button.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/core/constant/app_images.dart';
import 'package:gueloprboy/core/constant/app_text_styles.dart';

class SuccessfulMessageScreen extends StatefulWidget {
  const SuccessfulMessageScreen({super.key});

  @override
  State<SuccessfulMessageScreen> createState() =>
      _SuccessfulMessageScreenState();
}

class _SuccessfulMessageScreenState extends State<SuccessfulMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.successfulImage),
              Text(
                'Successful',
                style: AppTextStyles.size24w600(color: AppColor.titleColor),
              ),
              Text(
                'Congratulations! Your password has been successfully updated. Click Continue to log in',
                style: AppTextStyles.size14w400(color: AppColor.subtitleColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.0,),
              PrimaryButton(
                  label: 'Continue',
                  backgroundColor: AppColor.primaryColor,
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, RouteName.loginScreen);
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
