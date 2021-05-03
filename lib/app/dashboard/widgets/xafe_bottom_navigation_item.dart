import 'package:flutter/widgets.dart';
import '../../../cores/constants/colors.dart';
import '../../../cores/constants/styles.dart';

/// [XafeBottomNavigationItem]
class XafeBottomNavigationItem extends StatelessWidget {
  /// icon
  final Widget icon;

  /// item label
  final String label;

  /// is item selected
  final bool selected;

  /// to show on selected
  final Widget activeIcon;

  ///
  final Function onTap;

  /// [XafeBottomNavigationItem] constructor
  XafeBottomNavigationItem({
    Key key,
    this.icon,
    this.label,
    this.selected = false,
    this.activeIcon,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: selected ? activeIcon : icon),
          SizedBox(height: 5.0),
          Text(
            label,
            style: textStyle.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: selected ? titleColor : subtitleColor,
            ),
          ),
        ],
      ),
    );
  }
}
