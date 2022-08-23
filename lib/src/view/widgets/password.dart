part of todo;

/// Reactive form password field widget for sign in/up forms
class PasswordField extends StatelessWidget {
  /// Initializes the widget
  PasswordField({super.key, required this.form});

  /// The form the field belongs to
  final FormGroup form;

  final _translationsController = Get.find<TranslationsController>();
  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ReactiveTextField<String>(
        formControlName: Strings.password,
        obscureText: !_authController.passwordVisibility.value,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          labelText: Strings.password.toT(
            <String>[
              if (_translationsController.isLocale(Language.el.locale))
                'ός'
              else
                ''
            ],
          ),
          hintText: Strings.passwordHint.toT(),
          suffixIcon: InkWell(
            onTap: _authController.passwordVisibility.toggle,
            child: Icon(
              _authController.passwordVisibility.value
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              size: 24,
            ),
          ),
        ),
      ).paddingOnly(bottom: context.height / 50),
    );
  }
}
