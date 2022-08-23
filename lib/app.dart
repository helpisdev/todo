part of todo;

/// App entry point
class CRDP extends StatelessWidget {
  /// Initializes the app
  CRDP({super.key});

  final _themeController = Get.find<ThemeController>();
  final _translationsController = Get.find<TranslationsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeController.themeMode,
        defaultTransition: Transition.cupertino,
        opaqueRoute: Get.isOpaqueRouteDefault,
        popGesture: Get.isPopGestureEnable,
        transitionDuration: const Duration(milliseconds: 230),
        translations: _translationsController.delegate,
        locale: _translationsController.locale,
        fallbackLocale: _translationsController.fallbackLocale,
        supportedLocales: TodoLocalizations.locales,
        localizationsDelegates: _translationsController.delegates,
        logWriterCallback: logger,
        initialRoute: Routes.auth,
        getPages: AppPages.pages,
      ),
    );
  }
}

/// Initializes storage and app settings controllers, sets status bar
/// brightness, and ensures widgets binding
Future<void> init() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
  );
  WidgetsFlutterBinding.ensureInitialized();
  Get
    ..put(RealmController(), permanent: true)
    ..put(AuthController(), permanent: true)
    ..put(TranslationsController(), permanent: true)
    ..put(ThemeController(), permanent: true);
}

/// Route configuration
abstract class Routes {
  /// Home page
  static const home = '/home';

  /// Auth page
  static const auth = '/auth';
}

/// Configures application pages with their bindings and named routes
abstract class AppPages {
  /// Application pages
  static List<GetPage<dynamic>> get pages {
    return [
      GetPage<AuthPage>(name: Routes.auth, page: AuthPage.new),
      GetPage<HomePage>(name: Routes.home, page: HomePage.new),
    ];
  }
}
