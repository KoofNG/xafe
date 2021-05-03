import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../cores/constants/styles.dart';
import 'budget_card.dart';

/// [Budget]
class BudgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '‍💻 Budgets',
              style: textStyle.copyWith(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.8,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return XafeBudgetCard();
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
