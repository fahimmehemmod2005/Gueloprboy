import 'package:flutter/material.dart';
import 'package:gueloprboy/app/routes/route_name.dart';
import 'package:gueloprboy/app/widgets/custom_rich_text.dart';
import 'package:gueloprboy/app/widgets/primary_button.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/core/constant/app_text_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../app/widgets/custom_text_field.dart';
import '../../viewmodel/login_view_model.dart';
import '../widgets/widget_title_subtitle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userName = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userName.addListener(_onFieldChanged);
    _password.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    final provider = context.read<LoginViewModel>();
    provider.validateForm(_userName.text, _password.text);
  }

  @override
  void dispose() {
    _userName.removeListener(_onFieldChanged);
    _password.removeListener(_onFieldChanged);
    _userName.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Screen build');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Consumer<LoginViewModel>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 72.0),
                    WidgetTitleSubtitle(
                      title: 'Welcome Back',
                      subTitle:
                          'Log in to continue managing your properties, services, or investments.',
                    ),
                    const SizedBox(height: 28.0),
                    InputField(
                      label: 'Email',
                      hintText: 'Enter your email',
                      controller: _userName,
                      validator: provider.validateEmail,
                    ),
                    const SizedBox(height: 16),
                    InputField(
                      label: 'Password',
                      hintText: 'Enter your password',
                      controller: _password,
                      obscureText: provider.isPasswordHidden,
                      suffixIcon: IconButton(
                        onPressed: provider.togglePassword,
                        icon: Icon(
                          provider.isPasswordHidden
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                      validator: provider.validatePassword,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          side: BorderSide(width: 1),
                          checkColor: Colors.white,
                          activeColor: AppColor.primaryColor,
                          value: provider.isChecked,
                          onChanged: (value) {
                            provider.toggleChecked(value!);
                          },
                        ),
                        Text(
                          'Remember me',
                          style: AppTextStyles.size14w400(
                            color: AppColor.primaryTextColor,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.forgotScreen,
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: AppTextStyles.size14w500(
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    PrimaryButton(
                      label: 'Login',
                      backgroundColor: provider.isFormValid
                          ? AppColor.primaryColor
                          : Color(0xffD6D6D6),
                      onPressed: provider.isFormValid
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacementNamed(context, RouteName.mainScreen);
                              }
                            }
                          : null,
                    ),
                    const SizedBox(height: 30.0),
                    Center(
                      child: CustomRichText(
                        text1: "Don't have an account? ",
                        text2: "Sign Up",
                        text2Tap: () {
                          Navigator.pushNamed(context, RouteName.signupScreen);
                        },
                      ),
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
