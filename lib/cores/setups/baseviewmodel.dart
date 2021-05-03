import 'package:flutter/widgets.dart';
import 'view_state.dart';

/// [ViewModel] for Xafe
class XafeBaseViewModel extends ChangeNotifier {
  /// Inital value
  ViewState appState = ViewState.idle;

  /// Set viewmodel state
  void setState({ViewState state}) {
    appState = state;
    notifyListeners();
  }
}
