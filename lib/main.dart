import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nge_store/firebase_options.dart';
import 'package:nge_store/services/hive/hive_key.dart';
import 'package:nge_store/shared/hive_models/account.dart';
import 'package:nge_store/shared/providers/cart_provider.dart';
import 'package:nge_store/theme/app_theme.dart';
import 'package:nge_store/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(AccountAdapter());
  await Hive.openBox<Account>(HiveKey.AccountBox);

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
