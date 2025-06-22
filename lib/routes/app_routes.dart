import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nge_store/modules/dashboard/providers/dashboard_provider.dart';
import 'package:nge_store/modules/dashboard/screens/dashboard_screen.dart';
import 'package:nge_store/modules/login/providers/login_provider.dart';
import 'package:nge_store/modules/login/screens/login_screen.dart';
import 'package:nge_store/modules/splash/providers/splash_provider.dart';
import 'package:nge_store/modules/splash/screens/splash_screen.dart';
import 'package:nge_store/routes/app_paths.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter routers = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Paths.SPLASH,
  routes: [
    GoRoute(
      path: Paths.SPLASH,
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => SplashProvider(),
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: Paths.LOGIN,
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => LoginProvider(),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: Paths.DASHBOARD,
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => DashboardProvider(),
        child: const DashboardScreen(),
      ),
    ),
  ],
);
