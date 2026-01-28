import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:retiresmart/core/getPages.dart';
import 'package:retiresmart/core/rockCode/cash_serves.dart';
import 'package:retiresmart/core/text_core.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retiresmart/RetireSmart/data/dataSources/retire_dataSources.dart';
import 'package:retiresmart/core/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  RetireDataSources().getInflation();

  await CacheService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get saved theme preference
    final bool isDark = CacheService().getFromCash('is_dark_mode') ?? true;

    return GetMaterialApp(
      getPages: pages,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,

      // Light Theme Configuration
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppThemeColors.light.background,
        extensions: [AppThemeColors.light],
      ),

      // Dark Theme Configuration
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppThemeColors.dark.background,
        extensions: [AppThemeColors.dark],
      ),

      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

      locale: Locale(TextCore.lan),
      fallbackLocale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
