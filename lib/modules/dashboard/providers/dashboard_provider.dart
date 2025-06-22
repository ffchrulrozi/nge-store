import 'package:nge_store/base/base_provider.dart';

class DashboardProvider extends BaseProvider {
  int screenIndex = 0;

  void setScreenIndex(int index){
    screenIndex = index;
    notifyListeners();
  }
}