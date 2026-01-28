import 'package:get_x/get_navigation/src/routes/get_route.dart';
import 'package:retiresmart/GoldPrice/presentation/controller/gold_binding.dart';
import 'package:retiresmart/GoldPrice/presentation/screens/gold_screen.dart';
import 'package:retiresmart/RetireSmart/presentation/controllers/retirement_binding.dart';
import 'package:retiresmart/RetireSmart/presentation/screens/retirement_wizard_screen.dart';
import 'package:retiresmart/GoalSelection/presentation/pages/goal_selection_page.dart';
import 'package:retiresmart/GoalSelection/presentation/controller/goal_selection_binding.dart';
import 'package:retiresmart/Settings/presentation/controller/settings_binding.dart';
import 'package:retiresmart/Settings/presentation/pages/settings_page.dart';
import 'package:retiresmart/Splash/presentation/pages/splash_page.dart';
import 'package:retiresmart/Splash/presentation/controller/splash_binding.dart';
import 'package:retiresmart/Onboarding/presentation/pages/onboarding_page.dart';
import 'package:retiresmart/Onboarding/presentation/controller/onboarding_binding.dart';

import 'package:retiresmart/RetireSmart/presentation/screens/need_help_screen.dart';
import 'package:retiresmart/RetireSmart/presentation/screens/risk_quiz_screen.dart';

List<GetPage> pages = [
  GetPage(name: '/needHelp', page: () => const InvestmentGuideScreen()),
  GetPage(name: '/riskQuiz', page: () => const RiskQuizScreen()),
  GetPage(
    name: '/settings',
    page: () => const SettingsPage(),
    binding: SettingsBinding(),
  ),
  GetPage(
    name: '/retirement',
    page: () => const RetirementWizardScreen(),
    binding: RetirementBinding(),
  ),

  GetPage(name: '/', page: () => const SplashPage(), binding: SplashBinding()),

  GetPage(
    // Replaced '/' with '/home' for the main hub
    name: '/home',
    page: () => const GoalSelectionPage(),
    binding: GoalSelectionBinding(),
  ),

  GetPage(
    name: '/gold',
    page: () => const GoldScreen(),
    binding: GoldBinding(),
  ),
  GetPage(
    name: '/onboarding',
    page: () => const OnboardingPage(),
    binding: OnboardingBinding(),
  ),
];
