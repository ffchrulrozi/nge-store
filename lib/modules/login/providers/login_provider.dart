import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:nge_store/base/base_provider.dart';
import 'package:nge_store/routes/app_paths.dart';
import 'package:nge_store/routes/app_routes.dart';
import 'package:nge_store/services/hive/hive_key.dart';
import 'package:nge_store/shared/hive_models/account.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoginProvider extends BaseProvider {
  String appVersion = "";
  var isLoading = false;
  String? status;

  LoginProvider() {
    _getAppVersion();
  }

  void _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    notifyListeners();
  }

  void login() {
    try {
      final GoogleSignIn signIn = GoogleSignIn.instance;

      var clientId =
          "111315039953-chddffgi4r6tkn01263hnchgsgd76r75.apps.googleusercontent.com";
      var serverClientId =
          "111315039953-erhdbt87lctdbnff68v79iqv2tg06ni4.apps.googleusercontent.com";
      signIn
          .initialize(clientId: clientId, serverClientId: serverClientId)
          .then((_) {
        signIn.authenticationEvents
            .listen(_handleAuthenticationEvent)
            .onError(_handleAuthenticationError);

        signIn.attemptLightweightAuthentication();
      });
    } catch (e) {
      status = "Login failed";
      notifyListeners();
    }
  }

  Future<void> _handleAuthenticationEvent(
    GoogleSignInAuthenticationEvent event,
  ) async {
    final GoogleSignInAccount? user = switch (event) {
      GoogleSignInAuthenticationEventSignIn() => event.user,
      GoogleSignInAuthenticationEventSignOut() => null,
    };

    if (user != null) {
      var account = Account(
        email: user.email,
        name: user.displayName,
        photo: user.photoUrl,
      );

      var accountBox = Hive.box<Account>(HiveKey.AccountBox);
      accountBox.add(account);

      navigatorKey.currentContext?.go(Paths.DASHBOARD.path);
    }
  }

  Future<void> _handleAuthenticationError(Object e) async {
    final response = e is GoogleSignInException
        ? _errorMessageFromSignInException(e)
        : 'Unknown error: $e';

    status = response;
    notifyListeners();
  }

  String _errorMessageFromSignInException(GoogleSignInException e) {
    return switch (e.code) {
      GoogleSignInExceptionCode.canceled => 'Sign in canceled',
      _ => 'GoogleSignInException ${e.code}: ${e.description}',
    };
  }
}
