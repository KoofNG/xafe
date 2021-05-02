import 'package:flutter/material.dart';
import 'colors.dart';

/// Defining global style for text
TextStyle textStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 32.0,
  fontStyle: FontStyle.normal,
  color: cardColor,
);

const String EMAIL_REGEX =
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
