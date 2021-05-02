import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants/colors.dart';

/// Xafe input field
class XafeInputField extends StatelessWidget {
  /// [Boolean] is the field a password field
  final bool isPassword;

  /// [String] hinttext as placeholder
  final String hintText;

  /// [Icon] [Svg] asset to show as prefix
  final Widget suffixIcon;

  /// [Function] to validate the field
  final Function validator;

  /// [Keyboard] type based on the field
  final TextInputType inputType;

  /// [Function] to be invoked when suffix icon is pressed
  final Function suffixIconOnPressed;

  /// [TextEditingController] to obtain value from the field
  final TextEditingController controller;

  /// Constructor
  XafeInputField({
    Key key,
    this.isPassword = false,
    this.hintText,
    this.suffixIcon,
    this.validator,
    this.inputType,
    this.suffixIconOnPressed,
    this.controller,
  }) : super(key: key);

  // final bool isDense;
  // final String inputPlaceholder;
  // final Widget prefixIcon;
  // final int maxLines;
  // final bool disabled;
  // final Function onTap;
  // final Function onSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: cardColor,
          suffixIcon: suffixIcon,
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: 0.0),
          hintStyle: TextStyle(
            color: subtitleColor,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red[400],
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: buttonColor.withOpacity(0.75),
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: buttonColor.withOpacity(0.75),
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          errorStyle: TextStyle(
            fontSize: 12.0,
            color: Colors.red[400],
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
        controller: controller,
        obscureText: isPassword ? true : false,
        // style: TextStyle(
        //   fontSize: 14.0,
        //   color: Theme.of(context).textSelectionHandleColor.withOpacity(0.8),
        //   fontWeight: FontWeight.bold,
        // ),
      ),
    );
  }
}
