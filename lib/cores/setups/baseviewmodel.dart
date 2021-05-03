import 'package:flutter/widgets.dart';

/// [ViewModel] for Xafe
class XafeBaseViewModel extends ChangeNotifier {
  /// Inital value
  bool appState = false;

  /// Set viewmodel state
  void setState({bool state}) {
    appState = state;
    notifyListeners();
  }
}
