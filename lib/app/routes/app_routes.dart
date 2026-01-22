import 'package:flutter/material.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/forgot_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/login_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/reset_password_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/signup_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/successful_message_screen.dart';
import 'package:gueloprboy/features/auth/presentation/view/screens/verification_screen.dart';
import 'package:gueloprboy/features/chat/presentation/view/screens/chat_screen.dart';
import 'package:gueloprboy/features/home/presentation/view/screens/home_screen.dart';
import 'package:gueloprboy/features/home/presentation/view/screens/notification_screen.dart';
import 'package:gueloprboy/features/main/view/main_screen.dart';
import 'package:gueloprboy/features/plots/presentation/view/screens/plots_screens.dart';
import 'package:gueloprboy/features/rent/presentation/view/screens/rent_screen.dart';
import 'package:gueloprboy/features/repair/presentation/view/screens/pending_screen.dart';
import 'package:gueloprboy/features/repair/presentation/view/screens/repair_screen.dart';
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

    // bottom navigation bar screen
    RouteName.mainScreen: (context) =>  const MainScreen(),

    // home screens
    RouteName.homeScreen: (context) =>  HomeScreen(),
    RouteName.notificationScreen: (context) =>  NotificationScreen(),

    // repair screen
    RouteName.repairScreen: (context) =>  const RepairScreen(),
    RouteName.pendingScreen: (context) =>  const PendingScreen(),

    // rent Screen
    RouteName.rentScreen: (context) =>  const RentScreen(),

    // plot screen
    RouteName.plotsScreen: (context) =>  const PlotsScreens(),

    // chat screen
    RouteName.chatScreen: (context) =>  const ChatScreen(  ),

  };
}