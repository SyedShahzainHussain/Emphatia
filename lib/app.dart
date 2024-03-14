import 'package:flutter/material.dart';
import 'package:store/features/authentication/view/splash_screen/splash_screen.dart';
import 'package:store/providers/app_provider.dart';
import 'package:store/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Empathia',
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
