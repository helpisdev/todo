part of todo;

/// Resizable text based on screen width. With the default [step], text resizes
/// to x1.5 of its minimum value (default 12) at 1920px (FHD).
class ResizableText extends StatelessWidget {
  /// [data] -> Required text content.
  /// [minFont] -> Minimum font size. Defaults to 12px.
  /// [maxFont] -> Maximum font size. Defaults to 24px.
  /// [step] -> The amount of px the font size should increase per 1px screen
  /// width increase. Defaults to 0.000260417. This step factor produces the
  /// 1.5x font size of [minFont] at 1920px (FHD). For example, if the provided
  /// [minFont] is 16px, then at a screen width of 1920px, the text font size
  /// would be 24px.
  /// [maxLines] -> Maximum number of lines the text could span before it
  /// overflows. Defaults to 1.
  /// [italic] -> Makes the text italic style. Defaults to false.
  /// [weight] -> Font weight. Defaults to [FontWeight.w600].
  /// [letterSpacing] -> Font letter spacing. Defaults to 1.0.
  /// [alignment] -> Text alignment. Defaults to [TextAlign.left].
  /// [overflow] -> Text overflow behavior. Defaults to [TextOverflow.ellipsis].
  /// [font] -> Font family. Defaults to [FontFamily.comfortaa].
  /// [style] -> Custom text style.
  const ResizableText({
    super.key,
    required this.data,
    this.minFont = 12,
    this.maxFont = 24,
    this.step = 0.000260417,
    this.maxLines = 1,
    this.italic = false,
    this.weight = FontWeight.w600,
    this.letterSpacing = 1.0,
    this.alignment = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
    this.style,
  });

  /// [data] -> Required text content.
  final String data;

  /// [minFont] -> Minimum font size. Defaults to 12px.
  final double minFont;

  /// [maxFont] -> Maximum font size. Defaults to 24px.
  final double maxFont;

  /// [step] -> The amount of px the font size should increase per 1px screen
  /// width increase. Defaults to 0.000260417. This step factor produces the
  /// 1.5x font size of [minFont] at 1920px (FHD). For example, if the provided
  /// [minFont] is 16px, then at a screen width of 1920px, the text font size
  /// would be 24px.
  final double step;

  /// [maxLines] -> Maximum number of lines the text could span before it
  /// overflows. Defaults to 1.
  final int maxLines;

  /// [italic] -> Makes the text italic style. Defaults to false.
  final bool italic;

  /// [weight] -> Font weight. Defaults to [FontWeight.w600].
  final FontWeight weight;

  /// [letterSpacing] -> Font letter spacing. Defaults to 1.0.
  final double letterSpacing;

  /// [alignment] -> Text alignment. Defaults to [TextAlign.left].
  final TextAlign alignment;

  /// [overflow] -> Text overflow behavior. Defaults to [TextOverflow.ellipsis].
  final TextOverflow overflow;

  /// [style] -> Custom text style.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          TextStyle(
            fontWeight: weight,
            fontStyle: italic ? FontStyle.italic : FontStyle.normal,
            letterSpacing: letterSpacing,
            fontSize: max(
              min(maxFont, minFont * ((context.width * step) + 1)),
              minFont,
            ),
          ),
      textAlign: alignment,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
