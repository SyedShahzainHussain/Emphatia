import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/view/splash_screen/splash_screen.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/patient/services/user_view_model.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Welcome Phycology"),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                onPressed: () {
                  context.read<UserViewModel>().remove().then((value) {
                    context.read<UserViewModel>().removeUserType();
                    THelperFunction.navigatedToScreenWithPop(
                        context, const SplashScreen());
                  });
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
