import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../cores/constants/colors.dart';
import '../viewmodel/dashboard_viewmodel.dart';
import 'xafe_bottom_navigation_item.dart';

/// [XafeBottonNavigationBar]
class XafeBottomNavigationBar extends StatelessWidget {
  ///
  final DashboardViewModel dashboardViewModel;

  ///
  XafeBottomNavigationBar({
    Key key,
    this.dashboardViewModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      child: Container(
        height: 60.0,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            XafeBottomNavigationItem(
              icon: SvgPicture.asset('lib/assets/svgs/home_inactive.svg'),
              activeIcon: SvgPicture.asset('lib/assets/svgs/home.svg'),
              label: 'Home',
              selected: dashboardViewModel.index == 0,
              onTap: () => dashboardViewModel.setNewTab(i: 0),
            ),
            SizedBox(width: 30.0),
            XafeBottomNavigationItem(
              icon: SvgPicture.asset('lib/assets/svgs/search_inactive.svg'),
              activeIcon: Icon(Icons.search, color: titleColor),
              label: 'Categories',
              selected: dashboardViewModel.index == 1,
              onTap: () => dashboardViewModel.setNewTab(i: 1),
            ),
            SizedBox(width: 30.0),
            XafeBottomNavigationItem(
              icon: SvgPicture.asset('lib/assets/svgs/budget_inactive.svg'),
              activeIcon: SvgPicture.asset('lib/assets/svgs/budget.svg'),
              label: 'Budget',
              selected: dashboardViewModel.index == 2,
              onTap: () => dashboardViewModel.setNewTab(i: 2),
            ),
          ],
        ),
      ),
    );
  }
}
