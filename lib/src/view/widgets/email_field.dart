part of todo;

/// Reactive form password field widget for sign in/up forms
class EmailField extends StatelessWidget {
  /// Initializes the widget
  const EmailField({super.key, required this.form});

  /// The form the field belongs to
  final FormGroup form;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: Strings.email,
      textInputAction: TextInputAction.next,
      onSubmitted: (control) => form.focus(Strings.password),
      decoration: InputDecoration(
        labelText: Strings.email.toT(),
        hintText: Strings.emailHint.toT(),
      ),
    ).paddingOnly(bottom: context.height / 50);
  }
}
