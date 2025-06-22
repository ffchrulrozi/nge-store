import 'package:go_router/go_router.dart';
import 'package:nge_store/base/base_provider.dart';
import 'package:nge_store/routes/app_paths.dart';
import 'package:nge_store/routes/app_routes.dart';

class SplashProvider extends BaseProvider {
  SplashProvider() {
    onInit();
  }

  void onInit() {
    Future.delayed(
      Duration(seconds: 2),
      () => navigatorKey.currentContext?.go(Paths.LOGIN),
    );
  }
}
