import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension GetSize on BuildContext {
  double get width => mediaQuery.size.width;
  double get height => mediaQuery.size.height;
  double get paddingTop => mediaQuery.padding.top;
  double get paddingBottom => mediaQuery.padding.bottom;
}

extension DateExtension on DateTime {
  // String get dateFormat => "$day.$month.$year ${DateFormat.Hm(this).toString()}";
  String get dateFormat => DateFormat("dd.MM.yyyy · HH:mm").format(this);
}
