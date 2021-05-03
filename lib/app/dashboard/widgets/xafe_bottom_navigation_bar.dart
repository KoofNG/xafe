import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../cores/constants/colors.dart';
import 'xafe_bottom_navigation_item.dart';

/// [XafeBottonNavigationBar]
class XafeBottomNavigationBar extends StatelessWidget {
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
              selected: true,
            ),
            SizedBox(width: 30.0),
            XafeBottomNavigationItem(
              icon: SvgPicture.asset('lib/assets/svgs/search_inactive.svg'),
              activeIcon: Icon(Icons.search, color: titleColor),
              label: 'Categories',
            ),
            SizedBox(width: 30.0),
            XafeBottomNavigationItem(
              icon: SvgPicture.asset('lib/assets/svgs/budget_inactive.svg'),
              activeIcon: SvgPicture.asset('lib/assets/svgs/budget.svg'),
              label: 'Budget',
            ),
          ],
        ),
      ),
    );
  }
}
