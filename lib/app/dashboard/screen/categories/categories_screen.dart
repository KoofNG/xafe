import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/routes.dart';
import '../../../../cores/constants/styles.dart';

/// [Categories]
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '‍💻 Categories',
                  style: textStyle.copyWith(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, addNewCategory);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: backgroundColor2,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Icon(
                      Icons.add,
                      color: cardColor,
                    ),
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
                            child: Row(
                              children: [
                                Container(
                                  height: 36.0,
                                  width: 36.0,
                                  child: Image(
                                    image: AssetImage(
                                      'lib/assets/images/food.png',
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Food',
                                      style: textStyle.copyWith(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        color: titleColor,
                                      ),
                                    ),
                                    Text(
                                      '03/12/20',
                                      style: textStyle.copyWith(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        color: subtitleColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),

                            // Text(
                            //   '📄 Bill Payments',
                            //   style: textStyle.copyWith(
                            //     fontSize: 16.0,
                            //     fontWeight: FontWeight.w500,
                            //     color: titleColor,
                            //   ),
                            // ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: orangeColor.withAlpha(45),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              'remove',
                              style: textStyle.copyWith(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                                color: orangeColor,
                              ),
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
}
