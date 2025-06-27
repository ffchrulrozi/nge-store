import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:nge_store/base/base_provider.dart';
import 'package:nge_store/routes/app_paths.dart';
import 'package:nge_store/routes/app_routes.dart';
import 'package:nge_store/services/auth_service.dart';
import 'package:nge_store/services/hive/hive_key.dart';
import 'package:nge_store/shared/hive_models/account.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoginProvider extends BaseProvider {
  final AuthService _authService = AuthService();
  String appVersion = "";
  var isLoading = false;
  String? status;

  LoginProvider(){
    _getAppVersion();
  }

  void _getAppVersion ()async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    notifyListeners();
  }

  void login(BuildContext context) {
    _authService.signInWithGoogle().then((value) {
      if (value != null) {
        var account = Account(
          email: value.email ?? "",
          name: value.displayName ?? "",
          photo: value.photoURL,
        );

        var accountBox = Hive.box<Account>(HiveKey.AccountBox);
        accountBox.add(account);

        navigatorKey.currentContext?.go(Paths.DASHBOARD.path);
      } else {
        status = "Login failed";
        notifyListeners();
      }
    });
  }
}
