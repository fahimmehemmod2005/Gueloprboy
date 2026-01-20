import 'package:flutter/material.dart';
import 'package:gueloprboy/app/routes/route_name.dart';
import 'package:gueloprboy/app/widgets/custom_text_field.dart';
import 'package:gueloprboy/features/auth/presentation/view/widgets/widget_header.dart';
import 'package:gueloprboy/features/auth/presentation/view/widgets/widget_title_subtitle.dart';
import 'package:gueloprboy/features/auth/presentation/viewmodel/reset_password_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../app/widgets/primary_button.dart';
import '../../../../../core/constant/app_color.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // listen to text changes
    _passwordController.addListener(_onChanged);
    _confirmPasswordController.addListener(_onChanged);
  }

  void _onChanged() {
    final provider = context.read<ResetPasswordViewModel>();
    provider.validateForm(
      _passwordController.text,
      _confirmPasswordController.text,
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Consumer<ResetPasswordViewModel>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    WidgetHeader(title: 'Reset Password', width: 110),
                    const SizedBox(height: 16.0),
                    WidgetTitleSubtitle(
                      title: 'Set a new Password',
                      subTitle: 'Create a new password',
                    ),
                    const SizedBox(height: 24.0),

                    InputField(
                      label: 'Password',
                      hintText: 'Enter a new password',
                      obscureText: provider.isPasswordHidden,
                      controller: _passwordController,
                      validator: provider.validatePassword,
                      suffixIcon: IconButton(
                        onPressed: provider.togglePassword,
                        icon: Icon(
                          provider.isPasswordHidden
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24.0),

                    InputField(
                      label: 'Confirm Password',
                      hintText: 'Confirm your password',
                      controller: _confirmPasswordController,
                      obscureText: provider.isConfirmHidden,
                      suffixIcon: IconButton(
                        onPressed: provider.toggleConfirm,
                        icon: Icon(
                          provider.isConfirmHidden
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                      validator: (val) => provider.validateConfirmPassword(
                        val,
                        _passwordController.text,
                      ),
                    ),

                    const SizedBox(height: 30.0),

                    PrimaryButton(
                      label: 'Reset password',
                      backgroundColor: provider.isFormValid
                          ? AppColor.primaryColor
                          : Color(0xffD6D6D6),
                      onPressed: provider.isFormValid
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(context, RouteName.successfulMessageScreen);
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
