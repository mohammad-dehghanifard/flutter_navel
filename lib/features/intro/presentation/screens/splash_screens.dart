import 'package:flutter/material.dart';
import 'package:flutter_navel/core/animations/fade_in_up_animation.dart';
import 'package:flutter_navel/core/constants/app_strings.dart';
import 'package:flutter_navel/core/constants/diemsn.dart';
import 'package:flutter_navel/core/extensions/sizedbox_extension.dart';
import 'package:flutter_navel/core/gen/assets.gen.dart';
import 'package:flutter_navel/core/routes/navigators.dart';

class SplashScreens extends StatefulWidget {
  static String routeName = "/";
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) {
      if (mounted) {
        Navigators.navigateToOnboardingScreen(context: context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.pagesMargin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              // logo
              FadeInUpAnimation(
                  duration: Duration(milliseconds: 750),
                childOffset: Offset(0, 30),
                  child: Assets.image.appLogo.image(),
              ),

              Spacer(),
              Text(AppStrings.splashAppName,style: textTheme.titleMedium),
              Dimens.small6.height,
              Text(AppStrings.splashAppDescription,style: textTheme.bodySmall!.copyWith(letterSpacing: 4)),

            ],
          ),
        ),
      ),
    );
  }
}
