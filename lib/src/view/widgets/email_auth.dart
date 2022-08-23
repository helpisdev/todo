part of todo;

/// Email authentication widget
class AuthWithEmail extends StatelessWidget {
  /// Constructs email authentication button based on whether they are intended
  /// for sign in or sign up
  const AuthWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final email = Strings.signInWithEmail;
    return [
      email
          .toT()
          .toResText(
            maxLines: 4,
            alignment: TextAlign.center,
            minFont: 13,
            maxFont: 48,
          )
          .paddingSymmetric(horizontal: context.width / 80)
          .flexible(flex: 4),
    ].toRow(mainAxisAlignment: MainAxisAlignment.center).paddingOnly(
          top: context.height / 20,
          bottom: context.height / 30,
          right: context.width / 80,
          left: context.width / 80,
        );
  }
}
