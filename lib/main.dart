import 'package:flutter/material.dart';
import 'package:nge_store/modules/dashboard/providers/dashboard_provider.dart';
import 'package:nge_store/modules/home/providers/home_provider.dart';
import 'package:nge_store/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:nge_store/modules/login/providers/login_provider.dart';
import 'package:nge_store/modules/splash/providers/splash_provider.dart';
import 'package:nge_store/routes/app_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashProvider>(
          create: (_) => SplashProvider(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider<DashboardProvider>(
          create: (_) => DashboardProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Ship Shop",
      theme: appTheme,
      routerConfig: routers,
    );
  }
}
