import 'package:flutter/material.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/forgot_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/login_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/reset_password_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/signup_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/successful_message_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/verification_screen.dart';
import 'package:gueloprboy/features/home/presentation/view/screens/chat_screen.dart';
import 'package:gueloprboy/features/home/presentation/view/screens/home_screen.dart';
import 'package:gueloprboy/features/home/presentation/view/screens/main_screen.dart';
import 'package:gueloprboy/features/home/presentation/view/screens/plots_screens.dart';
import 'package:gueloprboy/features/home/presentation/view/screens/rent_screen.dart';
import 'package:gueloprboy/features/home/presentation/view/screens/repair_screen.dart';
import 'package:gueloprboy/features/onboarding/presentation/view/screens/onboarding_screen.dart';
import '../../features/splash/splash_screen.dart';
import 'route_name.dart';

class AppRoutes {

  // initialRoute
  static const String initialRoute = RouteName.mainScreen;

  static final Map<String, WidgetBuilder> routes = {

    // ------------------- list of routes -------------------

    // splash screens
    RouteName.splashScreen: (context) => const SplashScreen(),

    // onboarding screens
    RouteName.onboardingScreen: (context) => const OnboardingScreen(),

    // Auth screens
    RouteName.loginScreen: (context) => const LoginScreen(),
    RouteName.signupScreen: (context) => const SignupScreen(),
    RouteName.forgotScreen: (context) => const ForgotScreen(),
    RouteName.verificationScreen: (context) =>  const VerificationScreen(email: '',form: '',),
    RouteName.resetPasswordScreen: (context) =>  const ResetPasswordScreen(),
    RouteName.successfulMessageScreen: (context) =>  const SuccessfulMessageScreen(),

    // home screens
    RouteName.mainScreen: (context) =>  const MainScreen(),
    RouteName.homeScreen: (context) =>  HomeScreen(),
    RouteName.repairScreen: (context) =>  const RepairScreen(),
    RouteName.rentScreen: (context) =>  const RentScreen(),
    RouteName.plotsScreen: (context) =>  const PlotsScreens(),
    RouteName.chatScreen: (context) =>  const ChatScreen(  ),

  };
}