import 'package:get_x/get_navigation/src/routes/get_route.dart';
import 'package:retiresmart/GoldPrice/presentation/controller/gold_binding.dart';
import 'package:retiresmart/GoldPrice/presentation/screens/gold_screen.dart';
import 'package:retiresmart/RetireSmart/presentation/screens/retirement_wizard_screen.dart';
import 'package:retiresmart/home_screen.dart';

List<GetPage> pages = [

  GetPage(
    name: '/retirement',
    page: () => const RetirementWizardScreen(),
    // binding: RetirementBinding(),
  ),

  GetPage(
    name: '/',
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  ),

  GetPage(
    name: '/gold',
    page: () => const GoldScreen(),
    binding: GoldBinding(),
  ),
];
