import 'package:flutter/material.dart';
import 'package:nge_store/theme/app_theme.dart';
import 'package:nge_store/routes/app_routes.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Nge Shop",
      theme: appTheme,
      routerConfig: routers,
    );
  }
}
