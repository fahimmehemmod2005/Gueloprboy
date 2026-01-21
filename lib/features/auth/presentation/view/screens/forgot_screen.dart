import 'package:flutter/material.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/verification_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/widgets/widget_title_subtitle.dart';
import 'package:gueloprboy/features/auth/presentation/viewmodel/forgot_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../app/widgets/custom_text_field.dart';
import '../../../../../app/widgets/primary_button.dart';
import '../widgets/widget_header.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onChanged);
  }

  void _onChanged() {
    context.read<ForgotViewModel>().validateForm(_emailController.text);
  }

  @override
  void dispose() {
    _emailController.removeListener(_onChanged);
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Consumer<ForgotViewModel>(
            builder: (context, provider, child) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    WidgetHeader(title: 'Forgot Password', width: 105.0),
                    const SizedBox(height: 16),
                    WidgetTitleSubtitle(
                      title: 'Forgot Password',
                      subTitle: 'Enter your email address',
                    ),
                    const SizedBox(height: 32),

                    InputField(
                      label: 'Email',
                      hintText: 'Enter your email',
                      controller: _emailController,
                      validator: provider.validateEmail,
                    ),

                    const SizedBox(height: 50.0),

                    PrimaryButton(
                      label: 'Continue',
                      backgroundColor: provider.isFormValid
                          ? AppColor.primaryColor
                          : Color(0xffD6D6D6),
                      onPressed: provider.isFormValid
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) =>
                                        VerificationScreen(email: _emailController.text.trim(),
                                          form: 'forgotScreen',
                                    ),
                                  ),
                                );
                              }
                            }
                          : null,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
