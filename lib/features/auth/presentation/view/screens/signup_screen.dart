import 'package:flutter/material.dart';
import 'package:gueloprboy/app/routes/route_name.dart';
import 'package:gueloprboy/app/widgets/custom_rich_text.dart';
import 'package:gueloprboy/app/widgets/custom_text_field.dart';
import 'package:gueloprboy/app/widgets/primary_button.dart';
import 'package:gueloprboy/core/constant/app_color.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/verification_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/widgets/widget_title_subtitle.dart';
import 'package:gueloprboy/features/auth/presentation/viewmodel/signup_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/widget_country_picker_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _userName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final provider = context.read<SignupViewModel>();

    // Add listeners to validate form on each input change
    _userName.addListener(() {
      provider.validateForm(
        name: _userName.text,
        email: _email.text,
        phone: _phone.text,
        password: _password.text,
      );
    });

    _email.addListener(() {
      provider.validateForm(
        name: _userName.text,
        email: _email.text,
        phone: _phone.text,
        password: _password.text,
      );
    });

    _phone.addListener(() {
      provider.validateForm(
        name: _userName.text,
        email: _email.text,
        phone: _phone.text,
        password: _password.text,
      );
    });

    _password.addListener(() {
      provider.validateForm(
        name: _userName.text,
        email: _email.text,
        phone: _phone.text,
        password: _password.text,
      );
    });
  }

  @override
  void dispose() {
    _userName.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Consumer<SignupViewModel>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32.0),
                    const WidgetTitleSubtitle(
                      title: 'Sign up',
                      subTitle:
                      'Let’s get you set up! Please complete the form below to create your account',
                    ),
                    const SizedBox(height: 20.0),

                    // Name
                    InputField(
                      label: 'Name',
                      hintText: 'Enter your Name',
                      controller: _userName,
                      validator: provider.validateName,
                    ),
                    const SizedBox(height: 10.0),

                    // Email
                    InputField(
                      label: 'Email',
                      hintText: 'Enter your Email',
                      controller: _email,
                      validator: provider.validateEmail,
                    ),
                    const SizedBox(height: 10.0),

                    // Phone
                    WidgetCountryPickerField(
                      label: 'Phone',
                      hintText: 'Enter phone number',
                      controller: _phone,
                      validator: (phone) =>
                          provider.validatePhoneString(phone?.number),
                    ),
                    const SizedBox(height: 10.0),

                    // Password
                    InputField(
                      label: 'Password',
                      hintText: 'Enter your Password',
                      controller: _password,
                      obscureText: provider.isPasswordHidden,
                      suffixIcon: IconButton(
                        icon: Icon(provider.isPasswordHidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                        onPressed: provider.togglePassword,
                      ),
                      validator: provider.validatePassword,
                    ),
                    const SizedBox(height: 16.0),

                    // Terms Checkbox
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: AppColor.primaryColor,
                          value: provider.isTermsChecked,
                          onChanged: provider.toggleTerms,
                        ),
                        CustomRichText(
                          text1: 'I agree to the ',
                          text2: 'Terms of Service ',
                          text2Tap: () {},
                          text3: 'and ',
                          text4: 'Privacy Policy',
                          text4Tap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),

                    // Sign Up Button
                    PrimaryButton(
                      label: 'Sign Up',
                      onPressed: provider.isFormValid
                          ? () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder:
                                      (builder) => VerificationScreen(
                                          email: _email.text.trim(),
                                        form: 'signupScreen',
                                      )));
                        }
                      }
                          : null,
                      backgroundColor: provider.isFormValid
                          ? AppColor.primaryColor
                          : const Color(0xffD6D6D6),
                    ),
                    const SizedBox(height: 30.0),

                    // Login Link
                    Center(
                      child: CustomRichText(
                        text1: 'Already have an account? ',
                        text2: 'Log In',
                        text2Tap: () {
                          Navigator.pushNamed(
                              context, RouteName.loginScreen);
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
