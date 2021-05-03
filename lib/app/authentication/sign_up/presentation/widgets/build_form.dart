import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../cores/constants/colors.dart';
import '../../../../../cores/constants/styles.dart';

/// Widget for building each step of the form
class BuildForm extends StatelessWidget {
  /// index of the form field
  final int index;

  /// index of the form stage
  final int stage;

  /// title of the form
  final String title;

  /// child of the form
  final Widget child;

  /// form constructor
  BuildForm({
    Key key,
    this.index = 0,
    this.stage = 0,
    this.title,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return index == stage
        ? Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 36.0,
                    color: titleColor,
                  ),
                ),
                SizedBox(height: 10.0),
                child ?? SizedBox.shrink(),
              ],
            ),
          )
        : SizedBox.shrink();
  }
}
