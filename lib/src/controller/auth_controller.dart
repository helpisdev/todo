part of todo;

/// Controls the login process
class AuthController extends GetxController {
  final _user = RealmController.app.currentUser.obs;
  final _realmController = Get.find<RealmController>();

  /// Returns the current logged in user or null
  User? get user => _user.value;

  /// Observable user to attach listeners
  Rx<User?> get rxUser => _user;

  /// Password visibility status
  final passwordVisibility = false.obs;

  /// Used to show a circular loading indicator
  final RxBool _loading = false.obs;

  /// Gets a loading widget
  Widget get loading => _loading.value
      ? const CircularProgressIndicator().center()
      : const SizedBox.shrink();

  /// Sets loading value
  void load() => _loading.value = true;

  /// Unsets loading value
  void unload() => _loading.value = false;

  /// Handles sign in formflow
  Future<void> handleSignIn(FormGroup form) async {
    if (form.valid) {
      load();
      var success = true;
      final email = form.control(Strings.email).value.toString();
      final password = form.control(Strings.password).value.toString();
      try {
        await RealmController.app.logIn(
          Credentials.emailPassword(email, password),
        );
      } catch (e) {
        success = false;
        logger('Error signing in: ${e.toString()}', isError: true);
      }
      if (success) {
        _user.value = RealmController.app.currentUser;
        final realm = await _realmController.open(user: _user.value);
        unload();
        if (realm != null) {
          await Get.offAndToNamed<dynamic>(Routes.home);
        }
      } else {
        form.markAllAsTouched();
        Get.showSnackbar(
          GetSnackBar(
            message: Strings.authError.toT(),
            onTap: (snack) => Get.closeCurrentSnackbar(),
            duration: const Duration(seconds: 5),
            margin: const EdgeInsets.only(
              bottom: 10,
              right: 10,
              left: 10,
            ),
            borderRadius: 6,
            backgroundColor: Get.theme.primaryColor,
          ),
        );
      }
    } else {
      form.markAllAsTouched();
    }
    unload();
  }

  /// Logs a user out and closes any opened realms
  Future<void> logout() async {
    _realmController.close();
    await _user.value?.logOut();
    _user.value = RealmController.app.currentUser;
    logger('Logged out.');
    await Get.offAllNamed<dynamic>(Routes.auth);
  }
}
