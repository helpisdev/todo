part of todo;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Strings.signOut
            .toT()
            .toResText()
            .toTextButton(Get.find<AuthController>().logout),
      ),
    );
  }
}
