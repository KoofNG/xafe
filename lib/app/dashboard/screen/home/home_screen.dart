import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/routes.dart';
import '../../../../cores/constants/styles.dart';
import 'widget/bottom_sheet_item.dart';

/// [HomeScreen]
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          buildShowModalBottomSheet(context);
                        },
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: cardColor,
                          ),
                          child: SvgPicture.asset(
                            'lib/assets/svgs/edit.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: cardColor,
                ),
                child: ListView.separated(
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '📄 Bill Payments',
                              style: textStyle.copyWith(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: titleColor,
                              ),
                            ),
                          ),
                          Text(
                            '\$500.00',
                            style: textStyle.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: titleColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, i) {
                    return Divider(color: subtitleColor, height: 1.0);
                  },
                  itemCount: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// build the bottom sheet
  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      context: context,
      builder: (builder) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.3,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 40.0),
              decoration: BoxDecoration(
                color: cardColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  XafeBottomSheetItem(
                    title: 'Add an Expense',
                    assetName: 'expense',
                    onTap: () => Navigator.pushNamed(
                      context,
                      addExpense,
                    ).then(
                      (value) => Navigator.pop(context),
                    ),
                  ),
                  XafeBottomSheetItem(
                    title: 'Create a budget',
                    assetName: 'edit_expense',
                    onTap: () => Navigator.pushNamed(
                      context,
                      addBudget,
                    ).then(
                      (value) => Navigator.pop(context),
                    ),
                  ),
                  XafeBottomSheetItem(
                    title: 'Add a spending category',
                    assetName: 'spending',
                    onTap: () => Navigator.pushNamed(
                      context,
                      addNewCategory,
                    ).then(
                      (value) => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
