import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:nge_store/base/base_provider.dart';
import 'package:nge_store/routes/app_paths.dart';

class LoginProvider extends BaseProvider {
  var isLoading = false;

  void login(BuildContext context){
    context.go(Paths.DASHBOARD);
  }
}
