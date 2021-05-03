import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/styles.dart';

/// [HomeScreen]
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
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
}
