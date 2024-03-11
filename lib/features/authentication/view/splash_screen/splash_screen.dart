import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/viewModel/patient/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
     
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        splashServices.checkAuthentication(context);
      }
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              TTexts.logo.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .apply(fontStyle: FontStyle.italic, color: TColors.black),
            ),
            const SizedBox(
              height: TSized.spacebetweenSections,
            ),
            const Padding(
                padding: EdgeInsets.all(TSized.defaultSpace),
                child: CupertinoActivityIndicator(
                  color: TColors.primary,
                )),
          ],
        ),
      ),
    );
  }
}
