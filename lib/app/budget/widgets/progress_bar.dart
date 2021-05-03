import 'package:flutter/widgets.dart';

/// [XafeProgressBar] for showing progress
class XafeProgressBar extends StatelessWidget {
  ///
  final int count;

  ///
  final int value;

  /// [Color] color of the progress bar
  final Color color;

  ///
  XafeProgressBar({
    Key key,
    this.count,
    this.value,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: color.withAlpha(50),
            ),
          ),
          Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 0.0,
            child: Container(
              height: 10.0,
              width: (value / count) * MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
