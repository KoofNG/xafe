import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

/// Xafe Default App Bar
class XafeAppBar extends StatelessWidget {
  ///AppBar title
  final String title;

  /// XafeAppBar constructor
  XafeAppBar({
    Key key,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Stack(
          children: [
            Positioned(
              left: 0.0,
              child: Container(
                height: 20.0,
                width: 20.0,
                child: SvgPicture.asset(
                  'lib/assets/svgs/left_arrow.svg',
                ),
              ),
            ),
            title.isNotEmpty
                ? Center(
                    child: Text(
                      title,
                      style: textStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : SizedBox.shrink(),
          ],
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
