part of todo;

/// Light theme
final ThemeData lightTheme = FlexThemeData.light(
  scheme: FlexScheme.vesuviusBurn,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 30,
  appBarOpacity: 0.95,
  subThemesData: const FlexSubThemesData(
    // blendOnLevel: 30,
    defaultRadius: 6,
    // unselectedToggleIsColored: true,
    fabRadius: 40,
    chipRadius: 12,
    bottomNavigationBarElevation: 5,
    // navigationBarIndicatorOpacity: 0.25,
    navigationBarLabelBehavior:
        NavigationDestinationLabelBehavior.onlyShowSelected,
  ),
  // keyColors: const FlexKeyColors(),
  // tones: FlexTones.vividSurfaces(Brightness.light),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
);

/// Dark theme
final ThemeData darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.vesuviusBurn,
  surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
  blendLevel: 14,
  appBarStyle: FlexAppBarStyle.primary,
  appBarOpacity: 0.90,
  appBarElevation: 5,
  subThemesData: const FlexSubThemesData(
    // blendOnLevel: 30,
    defaultRadius: 6,
    // unselectedToggleIsColored: true,
    fabRadius: 40,
    chipRadius: 12,
    bottomNavigationBarElevation: 5,
    // navigationBarIndicatorOpacity: 0.25,
    navigationBarLabelBehavior:
        NavigationDestinationLabelBehavior.onlyShowSelected,
  ),
  // keyColors: const FlexKeyColors(
  //   keepTertiaryContainer: true,
  // ),
  // tones: FlexTones.vividSurfaces(Brightness.dark),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
);
