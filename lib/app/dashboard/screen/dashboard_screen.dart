import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../cores/constants/colors.dart';
import '../../../cores/widgets/xafe_base_widget.dart';
import '../viewmodel/dashboard_viewmodel.dart';
import '../widgets/xafe_animated_index.dart';
import '../widgets/xafe_bottom_navigation_bar.dart';
import 'budget/budget_screen.dart';
import 'categories/categories_screen.dart';
import 'home/home_screen.dart';

/// [Dashboard] screen or app main home page
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return XafeBaseWidget<DashboardViewModel>(
      model: DashboardViewModel(),
      onModelReady: (_) {},
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: backgroundColor1,
          body: SafeArea(
            child: XafeAnimatedIndexedStack(
              index: model.index,
              children: <Widget>[
                HomeScreen(),
                CategoriesScreen(),
                BudgetScreen(),
              ],
            ),
          ),
          bottomNavigationBar: XafeBottomNavigationBar(
            dashboardViewModel: model,
          ),
        );
      },
    );
  }
}
