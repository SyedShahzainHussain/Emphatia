import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/view/splash_screen/splash_screen.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/patient/user_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Welcome"),
            const SizedBox(height: 10,),
            OutlinedButton(
                onPressed: () {
                  context.read<UserViewModel>().remove().then((value) {
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
