import 'package:flutter/widgets.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/routes.dart';
import '../../../../cores/constants/styles.dart';
import '../../../budget/widgets/progress_bar.dart';

/// [Budget] card
class XafeBudgetCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, viewBudget);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Groceries',
                    style: textStyle.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      color: subtitleColor,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '\$40/month',
                    style: textStyle.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: titleColor,
                    ),
                  ),
                  SizedBox(height: 14.0),
                ],
              ),
            ),
            XafeProgressBar(
              color: backgroundColor2,
              count: 5,
              value: 2,
            ),
          ],
        ),
      ),
    );
  }
}
