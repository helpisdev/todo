// Copyright (C) Hellenic Progressive Internet Services, Inc.
// All Rights Reserved. 2022.
// Unauthorized copying of this file, via any medium is strictly prohibited.
// Proprietary and confidential.
// Written by Elias Kapareliotis <helpis@tutamail.com>.

part of todo;

/// The home screen once the user logs in successfully.
class AuthPage extends GetResponsiveView<AuthController> {
  /// Creates the user page
  AuthPage({super.key});

  /// Fields
  /// Fields for the sign in form with validators
  static Map<String, Object> get fields => <String, Object>{
        Strings.email: ['', Validators.required, Validators.email],
        Strings.password: ['', Validators.required],
      };

  /// Returns a reactive builder of the sign in form
  static ReactiveBuilder get form {
    return (context, form, child) => Obx(
          () => SizedBox(
            width: min(720, context.width * 0.75) * context.textScaleFactor,
            child: [
              [
                const AuthWithEmail(),
                EmailField(form: form),
                PasswordField(form: form),
                [
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: (2.5 / 100) * context.height,
                    spacing: (2.5 / 100) * context.width,
                    children: [
                      Strings.signIn.toT().toResText().toElevatedButton(
                            () => Get.find<AuthController>().handleSignIn(form),
                          ),
                    ],
                  ).expanded()
                ].toRow().padding(top: (2.5 / 100) * context.height),
              ]
                  .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
                  .paddingAll(20)
            ].toColumn(),
          )
              .card(elevation: 4)
              .center()
              .paddingSymmetric(vertical: context.height / 100),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Strings.signIn.toT().toResText(
                weight: FontWeight.w300,
                minFont: 16,
                maxFont: 36,
              ),
        ),
      ),
      body: Obx(
        () => [
          [
            ReactiveFormBuilder(
              form: () => fb.group(fields),
              builder: form,
            ),
          ]
              .toColumn(mainAxisAlignment: MainAxisAlignment.spaceEvenly)
              .center()
              .scrollable()
              .safeArea(),
          controller.loading
        ].toStack(),
      ),
    );
  }
}
