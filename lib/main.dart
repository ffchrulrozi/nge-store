import 'package:flutter/material.dart';
import 'package:nge_store/shared/providers/cart_provider.dart';
import 'package:nge_store/theme/app_theme.dart';
import 'package:nge_store/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        )
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
      title: "Nge Shop",
      theme: appTheme,
      routerConfig: routers,
    );
  }
}
