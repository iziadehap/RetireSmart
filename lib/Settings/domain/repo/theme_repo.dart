abstract class ThemeRepo {
  Future<void> saveTheme(bool isDarkMode);
  bool isDarkMode();
}
