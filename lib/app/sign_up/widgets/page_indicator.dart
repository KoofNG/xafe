import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../cores/constants/colors.dart';
import '../../../cores/utilities/helpers.dart';

/// Page Indicator
class PageIndicator extends StatelessWidget {
  /// Width of indicator
  final double width;

  /// [width]
  PageIndicator({
    Key key,
    @required this.width,
  })  : assert(width != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: screenAwareSize(6, context),
      width: screenAwareSize(width, context, width: true),
      decoration: BoxDecoration(
        color: titleColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
