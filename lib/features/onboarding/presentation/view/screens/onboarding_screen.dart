import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gueloprboy/app/routes/route_name.dart';
import 'package:gueloprboy/app/widgets/custom_rich_text.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/core/constant/app_images.dart';
import 'package:gueloprboy/core/constant/app_text_styles.dart';
import 'package:gueloprboy/features/onboarding/presentation/viewmodel/onboarding_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../../app/widgets/primary_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191D20),
      body: Stack(
        children: [
          Image.asset(AppImages.onboarding),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<OnboardingViewModel>(
                builder: (context, provider, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        provider.pages[provider.currentIndex]["title"]!,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.size32w500(color: Colors.white),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        provider.pages[provider.currentIndex]["subtitle"]!,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.size14w400(color: Colors.white),
                      ),

                      const SizedBox(height: 34),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          provider.pages.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 2.0.h,
                            width: 28.0.w,
                            decoration: BoxDecoration(
                              color: provider.currentIndex == index
                                  ? Colors.orange
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      PrimaryButton(
                        label: provider.isLast ? "Get Started" : "Next",
                        onPressed: () {
                          if (provider.isLast) {
                            Navigator.pushReplacementNamed(context, RouteName.signupScreen);
                          } else {
                            provider.next();
                          }
                        },
                      ),

                      const SizedBox(height: 16),

                      CustomRichText(
                        text1: 'Already have an account? ',
                        text2: 'Log In',
                        text2Tap: () {
                          Navigator.pushReplacementNamed(context, RouteName.loginScreen);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
