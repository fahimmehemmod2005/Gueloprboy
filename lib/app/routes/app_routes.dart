import 'package:flutter/material.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/forgot_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/login_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/signup_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/verification_screen.dart';
import 'package:gueloprboy/features/onboarding/presentation/view/screens/onboarding_screen.dart';
import '../../features/splash/splash_screen.dart';
import 'route_name.dart';

class AppRoutes {
  static const String initialRoute = RouteName.loginScreen;

  static final Map<String, WidgetBuilder> routes = {
    RouteName.splashScreen: (context) => const SplashScreen(),
    RouteName.onboardingScreen: (context) => const OnboardingScreen(),
    RouteName.loginScreen: (context) => const LoginScreen(),
    RouteName.signupScreen: (context) => const SignupScreen(),
    RouteName.forgotScreen: (context) => const ForgotScreen(),
    RouteName.verificationScreen: (context) => const VerificationScreen(),

  };
}