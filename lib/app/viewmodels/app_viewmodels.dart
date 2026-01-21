import 'package:gueloprboy/features/auth/presentation/viewmodel/forgot_view_model.dart';
import 'package:gueloprboy/features/auth/presentation/viewmodel/login_view_model.dart';
import 'package:gueloprboy/features/auth/presentation/viewmodel/reset_password_view_model.dart';
import 'package:gueloprboy/features/auth/presentation/viewmodel/signup_view_model.dart';
import 'package:gueloprboy/features/auth/presentation/viewmodel/verificaiton_view_model.dart';
import 'package:gueloprboy/features/main/viewmodel/main_view_model.dart';
import 'package:gueloprboy/features/onboarding/presentation/viewmodel/onboarding_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppViewModels {
  static final List<SingleChildWidget> viewModels = [
    ChangeNotifierProvider<OnboardingViewModel>(
      create: (_) => OnboardingViewModel(),
    ),
    ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(),
    ),
    ChangeNotifierProvider<ForgotViewModel>(
      create: (_) => ForgotViewModel(),
    ),
    ChangeNotifierProvider<VerificationViewModel>(
      create: (_) => VerificationViewModel(),
    ),
    ChangeNotifierProvider<ResetPasswordViewModel>(
      create: (_) => ResetPasswordViewModel(),
    ),
    ChangeNotifierProvider<SignupViewModel>(
      create: (_) => SignupViewModel(),
    ),
    ChangeNotifierProvider<MainViewModel>(
      create: (_) => MainViewModel(),
    ),
  ];
}
