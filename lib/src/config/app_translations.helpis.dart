library app_translations;

import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

export 'app_translations.helpis.dart';

/// App's localizations class.
class TodoLocalizations extends LocalizationsDelegate<TodoLocalizations>
    with Translations {
  /// Creates app's localization with the current [locale]
  TodoLocalizations([this.locale = fallbackLocale]);

  /// Current locale.
  Locale locale;

  /// Widgets localization delegate
  static const widgetsDelegate = GlobalWidgetsLocalizations.delegate;

  /// Cupertino localizations delegate
  static const cupertinoDelegate = GlobalCupertinoLocalizations.delegate;

  /// Material delegate
  static const materialDelegate = GlobalMaterialLocalizations.delegate;

  /// Loaded localizations
  static final Map<Locale, Future<TodoLocalizations>> _loadedTranslations =
      <Locale, Future<TodoLocalizations>>{};

  /// Helper method to get the current localizations based on context
  static TodoLocalizations of(BuildContext context) {
    return Localizations.of<TodoLocalizations>(context, TodoLocalizations)!;
  }

  /// Fallback locale
  static const Locale fallbackLocale = Locale.fromSubtags(
    languageCode: 'en',
  );

  /// Translations grouped per [String] instead of [Locale]
  static final Map<String, Map<String, String>> translationsPerString = {
    'authError': {
      'el': 'Η σύνδεση απέτυχε.',
      'en': 'Authentication failed.',
    },
    'el': {
      'el': 'Ελληνικά',
      'en': 'Greek',
    },
    'email': {
      'el': 'Email',
      'en': 'Email',
    },
    'emailAlreadyInUse': {
      'el': 'Το email σου είναι ήδη καταχωρημένο',
      'en': 'This email is already in use',
    },
    'emailHint': {
      'el': 'giannis100@gmail.com',
      'en': 'john100@gmail.com',
    },
    'emailValid': {
      'el': 'Το email σου πρέπει να έχει ορθή μορφή',
      'en': 'The email must be in valid format',
    },
    'en': {
      'el': 'Αγγλικά',
      'en': 'English',
    },
    'home': {
      'el': 'Αρχική',
      'en': 'Home',
    },
    'isRequired': {
      'el': '@1 @2 είναι απαραίτητ@3.',
      'en': 'The @2 is required.',
    },
    'language': {
      'el': 'Γλώσσα',
      'en': 'Language',
    },
    'lightTheme': {
      'el': 'Ανοιχτό θέμα',
      'en': 'Light theme',
    },
    'password': {
      'el': 'Κωδικ@1',
      'en': 'Password@1',
    },
    'passwordHint': {
      'el': r'rgTy423yt$r%AA',
      'en': r'rgTy423yt$r%AA',
    },
    'signIn': {
      'el': 'Συνδεθείτε',
      'en': 'Log in',
    },
    'signInWithEmail': {
      'el': 'Ή συνέχισε με το email σου',
      'en': 'Or sign in with your email',
    },
    'signOut': {
      'el': 'Αποσύνδεση',
      'en': 'Sign out',
    },
  };

  /// Translations grouped per [Locale] instead of [String]
  static final Map<String, Map<String, String>> translationsPerLocale = {}..[{
      for (final language in TodoLocalizations.languages)
        MapEntry(
          language,
          <String, String>{}..[{
              for (final entry
                  in TodoLocalizations.translationsPerString.entries)
                MapEntry(entry.key, entry.value[language])
            }],
        )
    }];

  /// App supported languages
  static List<String> get languages => const [
        'el',
        'en',
      ];

  /// App supported locales
  static List<Locale> get locales => const [
        Locale.fromSubtags(
          languageCode: 'el',
        ),
        Locale.fromSubtags(
          languageCode: 'en',
        ),
      ];

  /// Maps each locale to its list of translated strings
  @override
  Map<String, Map<String, String>> get keys =>
      TodoLocalizations.translationsPerLocale;

  /// Translation of key authError
  String get authError =>
      translationsPerString['authError']![locale.languageCode]!;

  /// Translation of key el
  String get el => translationsPerString['el']![locale.languageCode]!;

  /// Translation of key email
  String get email => translationsPerString['email']![locale.languageCode]!;

  /// Translation of key emailAlreadyInUse
  String get emailAlreadyInUse =>
      translationsPerString['emailAlreadyInUse']![locale.languageCode]!;

  /// Translation of key emailHint
  String get emailHint =>
      translationsPerString['emailHint']![locale.languageCode]!;

  /// Translation of key emailValid
  String get emailValid =>
      translationsPerString['emailValid']![locale.languageCode]!;

  /// Translation of key en
  String get en => translationsPerString['en']![locale.languageCode]!;

  /// Translation of key home
  String get home => translationsPerString['home']![locale.languageCode]!;

  /// Translation of key isRequired
  String get isRequired =>
      translationsPerString['isRequired']![locale.languageCode]!;

  /// Translation of key language
  String get language =>
      translationsPerString['language']![locale.languageCode]!;

  /// Translation of key lightTheme
  String get lightTheme =>
      translationsPerString['lightTheme']![locale.languageCode]!;

  /// Translation of key password
  String get password =>
      translationsPerString['password']![locale.languageCode]!;

  /// Translation of key passwordHint
  String get passwordHint =>
      translationsPerString['passwordHint']![locale.languageCode]!;

  /// Translation of key signIn
  String get signIn => translationsPerString['signIn']![locale.languageCode]!;

  /// Translation of key signInWithEmail
  String get signInWithEmail =>
      translationsPerString['signInWithEmail']![locale.languageCode]!;

  /// Translation of key signOut
  String get signOut => translationsPerString['signOut']![locale.languageCode]!;

  /// Bracket operator overload for key access.
  String? operator [](String key) =>
      translationsPerString[key]?[locale.languageCode];

  @override
  bool isSupported(Locale locale) => languages.contains(locale.languageCode);

  @override
  Future<TodoLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load"
    // operation isn't needed to produce an instance of
    // TodoLocalizations.
    this.locale = locale;
    return _loadedTranslations.putIfAbsent(
      locale,
      () => SynchronousFuture<TodoLocalizations>(this),
    );
  }

  @override
  bool shouldReload(TodoLocalizations old) => false;
}

/// Extension on TodoLocalizations to provide translation keys as static
/// values app wide.
extension Strings on TodoLocalizations {
  /// Getter of translation key authError
  static String get authError => 'authError';

  /// Getter of translation key el
  static String get el => 'el';

  /// Getter of translation key email
  static String get email => 'email';

  /// Getter of translation key emailAlreadyInUse
  static String get emailAlreadyInUse => 'emailAlreadyInUse';

  /// Getter of translation key emailHint
  static String get emailHint => 'emailHint';

  /// Getter of translation key emailValid
  static String get emailValid => 'emailValid';

  /// Getter of translation key en
  static String get en => 'en';

  /// Getter of translation key home
  static String get home => 'home';

  /// Getter of translation key isRequired
  static String get isRequired => 'isRequired';

  /// Getter of translation key language
  static String get language => 'language';

  /// Getter of translation key lightTheme
  static String get lightTheme => 'lightTheme';

  /// Getter of translation key password
  static String get password => 'password';

  /// Getter of translation key passwordHint
  static String get passwordHint => 'passwordHint';

  /// Getter of translation key signIn
  static String get signIn => 'signIn';

  /// Getter of translation key signInWithEmail
  static String get signInWithEmail => 'signInWithEmail';

  /// Getter of translation key signOut
  static String get signOut => 'signOut';
}

/// App supported languages enum
enum Language {
  /// Language code el
  el,

  /// Language code en
  en;

  /// Language code to locale
  Locale get locale {
    switch (this) {
      case Language.el:
        return Locale(Language.el.name);
      case Language.en:
        return Locale(Language.en.name);
    }
  }

  /// Converts string to language
  static Language of(String? representation) {
    var res = Language.el;
    if (representation != null) {
      for (final lng in Language.values) {
        if (lng.name == representation) {
          res = lng;
          break;
        }
      }
    }
    return res;
  }
}
