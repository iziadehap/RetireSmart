import 'package:retiresmart/Settings/domain/repo/theme_repo.dart';
import 'package:retiresmart/core/rockCode/cash_serves.dart';
import 'package:retiresmart/core/text_core.dart';

class ThemeRepoImpl implements ThemeRepo {
  final CacheService _cacheService;

  ThemeRepoImpl(this._cacheService);

  @override
  bool isDarkMode() {
    final result = _cacheService.getFromCash(TextCore.themeKey);
    // Default to dark mode if not set (keeping original app feel)
    return result ?? true;
  }

  @override
  Future<void> saveTheme(bool isDarkMode) async {
    await _cacheService.saveToCash(key: TextCore.themeKey, data: isDarkMode);
  }
}
