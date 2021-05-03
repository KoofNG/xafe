import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../cores/constants/colors.dart';
import '../widgets/xafe_animated_index.dart';
import '../widgets/xafe_bottom_navigation_bar.dart';
import 'categories/categories_screen.dart';
import 'home/home_screen.dart';

/// [Dashboard] screen or app main home page
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: XafeAnimatedIndexedStack(
          index: 0,
          children: <Widget>[
            CategoriesScreen(),
            HomeScreen(),
          ],
        ),
      ),
      bottomNavigationBar: XafeBottomNavigationBar(),
    );
  }
}
