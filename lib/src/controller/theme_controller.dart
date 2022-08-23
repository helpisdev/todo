part of todo;

/// Controls theming
class ThemeController extends GetxController {
  final RxBool _isDarkTheme = Get.isDarkMode.obs;

  /// Returns the cached theme mode, defaults to dark theme
  ThemeMode get themeMode => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  /// Returns the opposite cached theme
  ThemeData get oppositeTheme => isDarkTheme ? lightTheme : darkTheme;

  /// Returns the opposite cached theme
  ThemeData get currentTheme => isDarkTheme ? darkTheme : lightTheme;

  /// Verifies if the current theme is light
  bool get isLightTheme => !isDarkTheme;

  /// Verifies if the current theme is dark
  bool get isDarkTheme => _isDarkTheme.value;

  /// Changes the current theme
  void changeTheme({ThemeData? theme}) {
    if (theme == null || theme != Get.theme) {
      final newTheme = theme ?? oppositeTheme;
      _isDarkTheme.value = newTheme == darkTheme;
      Get
        ..changeTheme(newTheme)
        ..changeThemeMode(themeMode);
    }
  }

  /// Changes the theme mode
  void changeThemeMode({ThemeMode? newThemeMode}) {
    if (newThemeMode == null || themeMode != newThemeMode) {
      changeTheme(theme: oppositeTheme);
    }
  }
}
