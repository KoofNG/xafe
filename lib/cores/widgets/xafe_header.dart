import 'package:flutter/widgets.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

/// [Login] header widget
class XafeHeader extends StatelessWidget {
  /// [Title] of the header
  final String title;

  /// [Subtitle] of the header
  final String subTitle;

  /// [Header] constructor
  XafeHeader({
    Key key,
    this.title = '',
    this.subTitle = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? 'Set Title',
            style: textStyle.copyWith(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
              color: titleColor,
            ),
          ),
          SizedBox(height: 2.0),
          subTitle.isNotEmpty
              ? Text(
                  subTitle ?? 'Not set',
                  style: textStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: subColor,
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
