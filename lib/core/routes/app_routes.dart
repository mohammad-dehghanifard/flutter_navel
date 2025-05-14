import 'package:flutter/material.dart';
import 'package:flutter_navel/features/intro/presentation/screens/splash_screens.dart';

class AppRoutes {
  AppRoutes._();

  static final Map<String, Widget Function(BuildContext)> screenRoutes = {
    SplashScreens.routeName : (_) => SplashScreens()
  };
}