import 'package:flutter/material.dart';
import 'package:gueloprboy/app/routes/route_name.dart';
import 'package:gueloprboy/app/widgets/primary_button.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/core/constant/app_text_styles.dart';
import 'package:gueloprboy/features/auth/presentation/view/widgets/resend_button.dart';
import 'package:gueloprboy/app/widgets/widget_header.dart';
import 'package:gueloprboy/features/auth/presentation/view/widgets/widget_title_subtitle.dart';
import 'package:gueloprboy/features/auth/presentation/viewmodel/verificaiton_view_model.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  final String form;
  const VerificationScreen({
    super.key,
    required this.email,
    required this.form,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      height: 48,
      width: 54,
      textStyle: AppTextStyles.size16w600(color: AppColor.primaryTextColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.borderColor),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.primaryColor, width: 1.5),
      ),
    );
    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red, width: 1.5),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Consumer<VerificationViewModel>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    WidgetHeader(
                      title: 'Verification',
                      width: 125.0,
                    ),
                    const SizedBox(height: 16),

                    WidgetTitleSubtitle(
                      title: 'Verification',
                      subTitle: 'Enter the verification code we sent you:',
                    ),

                    Text(
                      widget.email,
                      style: AppTextStyles.size14w400(
                        color: AppColor.subtitleColor,
                      ),
                    ),

                    const SizedBox(height: 32),

                    Pinput(
                      validator: provider.otpValidator,
                      controller: _pinController,
                      length: 5,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      errorPinTheme: errorPinTheme,
                      onCompleted: (pin) {
                        debugPrint("OTP: $pin");
                      },
                      onChanged: (value) {
                        provider.validateOtp(value);
                      },
                    ),
                    const SizedBox(height: 24.0),
                    ResendButton(),
                    const SizedBox(height: 50.0),
                    PrimaryButton(
                      label: 'Submit',
                      backgroundColor: provider.isOtpValid
                          ? AppColor.primaryColor
                          : const Color(0xffD6D6D6),
                      onPressed: provider.isOtpValid
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                if (widget.form == 'forgotScreen') {
                                  Navigator.pushNamed(
                                    context,
                                    RouteName.resetPasswordScreen,
                                  );
                                } else if (widget.form == 'signupScreen') {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    RouteName.loginScreen,
                                  );
                                }
                              }
                            }
                          : null,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
