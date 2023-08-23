import 'package:flutter/material.dart';
import 'package:flutter_2_forms_app/config/router/app_router.dart';
import 'package:flutter_2_forms_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeCustom(isDarkMode: true, selectColor: 1);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      routerConfig: appRouter,
    );
  }
}
