import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:nge_store/base/base_provider.dart';
import 'package:nge_store/routes/app_paths.dart';
import 'package:nge_store/services/auth_service.dart';
import 'package:nge_store/services/hive/hive_key.dart';
import 'package:nge_store/shared/hive_models/account.dart';

class ProfileProvider extends BaseProvider {
  var accountBox = Hive.box<Account>(HiveKey.AccountBox);
  Account account = Account();

  ProfileProvider() {
    getProfile();
  }

  void getProfile() {
    account = accountBox.values.first;
    notifyListeners();
  }

  void logout(BuildContext context) {
    accountBox.clear();
    AuthService().signOut();
    context.go(Paths.LOGIN.path);
  }
}
