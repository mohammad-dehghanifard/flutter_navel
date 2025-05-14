import 'package:flutter/material.dart';
import 'package:flutter_navel/core/routes/app_routes.dart';
import 'package:flutter_navel/core/theme/app_themes.dart';


void main() {
  runApp(const NavelApp());
}

class NavelApp extends StatelessWidget {
  const NavelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navel',
      theme: AppThemes.darkTheme,
      routes: AppRoutes.screenRoutes,
    );
  }
}

