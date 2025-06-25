import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nge_store/modules/checkout/providers/checkout_provider.dart';
import 'package:nge_store/modules/checkout/screens/checkout_screen.dart';
import 'package:nge_store/modules/dashboard/providers/dashboard_provider.dart';
import 'package:nge_store/modules/dashboard/screens/dashboard_screen.dart';
import 'package:nge_store/modules/home/providers/home_provider.dart';
import 'package:nge_store/modules/login/providers/login_provider.dart';
import 'package:nge_store/modules/login/screens/login_screen.dart';
import 'package:nge_store/modules/product/providers/product_provider.dart';
import 'package:nge_store/modules/product/screens/product_screen.dart';
import 'package:nge_store/modules/profile/providers/profile_provider.dart';
import 'package:nge_store/modules/splash/providers/splash_provider.dart';
import 'package:nge_store/modules/splash/screens/splash_screen.dart';
import 'package:nge_store/modules/transaction/providers/transaction_provider.dart';
import 'package:nge_store/routes/app_paths.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter routers = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Paths.SPLASH.path,
  routes: [
    GoRoute(
      path: Paths.SPLASH.path,
      name: Paths.SPLASH.name,
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => SplashProvider(),
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: Paths.LOGIN.path,
      name: Paths.LOGIN.name,
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => LoginProvider(),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: Paths.DASHBOARD.path,
      name: Paths.DASHBOARD.name,
      builder: (context, state) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DashboardProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => HomeProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => TransactionProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ProfileProvider(),
          ),
        ],
        child: DashboardScreen(),
      ),
    ),
    GoRoute(
      path: Paths.PRODUCT.path,
      name: Paths.PRODUCT.name,
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => ProductProvider(state.pathParameters["id"]!),
        child: const ProductScreen(),
      ),
    ),
    GoRoute(
      path: Paths.CHECKOUT.path,
      name: Paths.CHECKOUT.name,
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => CheckoutProvider(),
        child: const CheckoutScreen(),
      ),
    ),
  ],
);
