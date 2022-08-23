part of todo;

/// typedef for button on press
typedef VoidFunction = void Function();

/// Reactive form build alias
typedef ReactiveBuilder = Widget Function(BuildContext, FormGroup, Widget?);

/// Logs messages on all platforms
void logger(String text, {bool isError = false}) {
  if (isError) {
    stderr.writeln(text);
  } else {
    stdout.writeln(text);
  }
}

///
extension TransformedResults on RealmResults<RealmObject> {
  ///
  RealmObject get random {
    final r = Random(length).nextInt(length);
    return this[r];
  }
}

/// Handles text styling
extension CRDPText on String {
  static final _translationsController = Get.find<TranslationsController>();

  /// Function for resizable text
  ResizableText toResText({
    double minFont = 12,
    double maxFont = 24,
    double step = 0.000260417,
    int maxLines = 1,
    bool italic = false,
    FontWeight weight = FontWeight.w600,
    double letterSpacing = 1.0,
    TextAlign alignment = TextAlign.left,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextStyle? style,
  }) {
    return ResizableText(
      data: this,
      minFont: minFont,
      maxFont: maxFont,
      step: step,
      maxLines: maxLines,
      italic: italic,
      weight: weight,
      letterSpacing: letterSpacing,
      alignment: alignment,
      overflow: overflow,
      style: style,
    );
  }

  /// Translates a string using translation controller with sentence case
  String toT([List<String> params = const <String>[]]) {
    return _translationsController.t(key: this, params: params);
  }

  /// Capitalizes first letter of string
  String toFirstCapital() {
    if (isEmpty) return this;
    return substring(0, 1).toUpperCase() + substring(1);
  }

  /// Transforms a string to a text button
  TextButton toTextButton(
    VoidFunction onPressed, [
    ButtonStyle? style,
  ]) =>
      toResText().toTextButton(onPressed, style);
}

/// Provides shortcut for resizable text
extension FontSize on ResizableText {
  /// Transforms a string to an elevated button
  ElevatedButton toElevatedButton(
    VoidFunction onPressed, [
    ButtonStyle? style,
  ]) {
    final _style = style ??
        ButtonStyle(
          elevation: const MaterialStatePropertyAll(4),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 2.5 * (Get.width / 200),
              vertical: Get.width / 200,
            ),
          ),
        );
    return ElevatedButton(
      onPressed: onPressed,
      style: _style,
      child: this,
    );
  }

  /// Transforms a string to a text button
  TextButton toTextButton(VoidFunction onPressed, [ButtonStyle? style]) {
    final _style = style ??
        ButtonStyle(
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
            ),
          ),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 2.5 * (Get.width / 200),
              vertical: Get.width / 200,
            ),
          ),
        );
    return TextButton(
      onPressed: onPressed,
      style: _style,
      child: constrained(maxWidth: 175),
    );
  }
}
