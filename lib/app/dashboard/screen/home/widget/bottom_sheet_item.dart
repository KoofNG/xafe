import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../cores/constants/colors.dart';
import '../../../../../cores/constants/styles.dart';

///
class XafeBottomSheetItem extends StatelessWidget {
  ///
  final String assetName;

  ///
  final String title;

  ///
  final Function onTap;

  ///
  const XafeBottomSheetItem({
    Key key,
    @required this.assetName,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              padding: EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                'lib/assets/svgs/$assetName.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 20.0),
                padding: EdgeInsets.symmetric(vertical: 15.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: subColor.withAlpha(50),
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: Text(
                  title,
                  style: textStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: titleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
