import 'package:flutter/widgets.dart';
import 'package:nge_store/assets/assets.gen.dart';
import 'package:nge_store/modules/splash/providers/splash_provider.dart';
import 'package:nge_store/utils/ext/size_ext.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
        builder: (BuildContext context, SplashProvider provider, Widget? child) {
      return Image.asset(
        Assets.lib.assets.img.splash.path,
        width: 100.w(context),
        height: 100.h(context),
        fit: BoxFit.cover,
      );
    });
  }
}
