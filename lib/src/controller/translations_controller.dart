part of todo;

/// Caches preferred translation locales
class TranslationsController extends GetxController {
  late final Rx<TodoLocalizations> _delegate;

  @override
  void onInit() {
    super.onInit();
    _delegate = TodoLocalizations(Get.deviceLocale ?? fallbackLocale).obs;
  }

  /// Returns the current locale
  Locale get locale => delegate.locale;

  /// Returns the current language
  Language get language => Language.of(delegate.locale.toLanguageTag());

  /// Returns the app's delegate
  TodoLocalizations get delegate => _delegate.value;

  /// Returns current locale's index
  int get localeIndex => TodoLocalizations.locales.indexOf(locale);

  /// Returns the app's delegates<
  List<LocalizationsDelegate<dynamic>> get delegates => [
        delegate,
        TodoLocalizations.materialDelegate,
        TodoLocalizations.cupertinoDelegate,
        TodoLocalizations.widgetsDelegate,
      ];

  /// Returns the first defined locale in app's translations as a fallback
  Locale get fallbackLocale => TodoLocalizations.fallbackLocale;

  /// Translates a key
  String _t({required String key}) => delegate[key] ?? key.tr;

  /// Translates a key with params
  String t({
    required String key,
    List<String> params = const <String>[],
    bool preserveCase = false,
  }) {
    var translation = _t(key: key);
    for (var i = 1; i <= params.length; ++i) {
      final param = _t(key: params[i - 1]);
      translation = translation.replaceFirst(
        '@$i',
        preserveCase ? param : param.toLowerCase(),
      );
    }
    return translation
        .replaceAll(RegExp('@[0-9]+'), '')
        .trim()
        .toFirstCapital();
  }

  /// Checks if the passed [locale] matches the current locale
  bool isLocale(Locale locale) => this.locale == locale;

  /// Checks if the current locale is Greek
  bool get isGreek => isLocale(Language.el.locale);

  /// Checks if the current locale is English
  bool get isEnglish => isLocale(Language.en.locale);

  /// Localized date format
  DateFormat get dateFormat =>
      isEnglish ? DateFormat('MM-dd-yyyy') : DateFormat('dd-MM-yyyy');

  /// Changes the current locale
  void changeLocale({Locale? locale}) {
    final newLocale = locale ??
        TodoLocalizations.locales.singleWhere(
          (element) => element != this.locale,
        );
    Get.updateLocale(newLocale);
    delegate.load(newLocale);
  }
}
