import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';

/// This is the Xafe App ButtonWidget
class XafeButton extends StatelessWidget {
  /// Function to be called when button is clicked
  final Function onPressed;

  /// Text shown in the button
  final String text;

  /// State of the button
  final bool busy;

  /// Passing the parameters to XafeButton
  XafeButton({
    Key key,
    this.onPressed,
    this.text,
    this.busy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: busy ? buttonColor.withOpacity(0.5) : buttonColor,
        border: Border.all(
          width: 0.0,
          style: BorderStyle.none,
        ),
      ),
      height: 60.0,
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: !busy
              ? Text(
                  text,
                  style: textStyle.copyWith(
                    color: cardColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : CircularProgressIndicator(
                  backgroundColor: cardColor,
                ),
        ),
      ),
    );
  }
}
