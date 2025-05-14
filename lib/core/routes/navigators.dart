import 'package:flutter/material.dart';
import 'package:flutter_navel/features/intro/presentation/screens/on_boarding_screen.dart';

class Navigators {
  Navigators._();

  static void navigateToOnboardingScreen({required BuildContext context}) {
    Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
  }
}