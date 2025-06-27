import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:nge_store/base/base_provider.dart';
import 'package:nge_store/routes/app_paths.dart';
import 'package:nge_store/routes/app_routes.dart';
import 'package:nge_store/services/hive/hive_key.dart';
import 'package:nge_store/shared/hive_models/account.dart';

class SplashProvider extends BaseProvider {
  var accountBox = Hive.box<Account>(HiveKey.AccountBox);

  SplashProvider() {
    onInit();
  }

  void onInit() {
    Future.delayed(Duration(seconds: 2), () {
      String nextPath =
          accountBox.isNotEmpty ? Paths.DASHBOARD.path : Paths.LOGIN.path;
      navigatorKey.currentContext?.go(nextPath);
    });
  }
}
