import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:nge_store/base/base_provider.dart';
import 'package:nge_store/routes/app_paths.dart';
import 'package:nge_store/routes/app_routes.dart';
import 'package:nge_store/services/hive/hive_key.dart';
import 'package:nge_store/shared/hive_models/account.dart';

class SplashProvider extends BaseProvider {
  String? splashImage;
  var accountBox = Hive.box<Account>(HiveKey.AccountBox);

  SplashProvider() {
    onInit();
  }

  void onInit() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();

    splashImage = remoteConfig.getString('splash_image');
    notifyListeners();

    Future.delayed(Duration(seconds: 4), () {
      String nextPath =
          accountBox.isNotEmpty ? Paths.DASHBOARD.path : Paths.LOGIN.path;
      navigatorKey.currentContext?.go(nextPath);
    });
  }
}
