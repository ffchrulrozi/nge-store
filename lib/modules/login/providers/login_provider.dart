import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:nge_store/base/base_provider.dart';
import 'package:nge_store/routes/app_paths.dart';
import 'package:nge_store/routes/app_routes.dart';
import 'package:nge_store/services/auth_service.dart';
import 'package:nge_store/services/hive/hive_key.dart';
import 'package:nge_store/shared/hive_models/account.dart';

class LoginProvider extends BaseProvider {
  final AuthService _authService = AuthService();
  var isLoading = false;
  String? status;

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
