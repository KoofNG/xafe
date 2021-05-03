import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../app/authentication/app_launch/screen/app_home_screen.dart';
import '../../app/authentication/sign_in/screen/sign_in_screen.dart';
import '../../app/authentication/sign_up/screen/sign_up_screen.dart';
import '../../app/budget/screens/add_budget/add_budget_screen.dart';
import '../../app/budget/screens/edit_budget/edit_budget_screen.dart';
import '../../app/budget/screens/view_budget/view_budget_screen.dart';
import '../../app/categories/screens/add_category_screen.dart';
import '../../app/dashboard/screen/dashboard_screen.dart';
import '../../app/expenses/screens/add_expenses_screen.dart';
import '../constants/routes.dart';

/// App Generating routes
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      return _buildPageRoute(page: AppHomeScreen());
      break;

    case signUpScreen:
      return _buildPageRoute(page: SignUpScreen());
      break;

    case signInScreen:
      return _buildPageRoute(page: SignInScreen());
      break;

    case dashboardScreen:
      return _buildPageRoute(page: DashboardScreen());
      break;

    case addNewCategory:
      return _buildPageRoute(page: AddCategoryScreen());
      break;

    case addBudget:
      return _buildPageRoute(page: AddBudgetScreen());
      break;

    case editBudget:
      return _buildPageRoute(page: EditBudgetScreen());
      break;

    case viewBudget:
      return _buildPageRoute(page: ViewBudgetScreen());
      break;

    case addExpense:
      return _buildPageRoute(page: AddExpenseScreen());
      break;

    default:
      return _errorRoute();
  }
}

Route<dynamic> _buildPageRoute({Widget page}) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(builder: (builder) => page);
  } else {
    return MaterialPageRoute(builder: (builder) => page);
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (context) {
      return Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      );
    },
  );
}
