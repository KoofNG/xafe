import '../../../cores/setups/baseviewmodel.dart';

/// Dashboard
class DashboardViewModel extends XafeBaseViewModel {
  int _index = 0;

  ///
  int get index => _index;

  /// set newTab
  void setNewTab({int i}) {
    _index = i;
    notifyListeners();
  }
}
