import 'package:flutter/material.dart';

extension SizeBoxExtention on double {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

extension MyintExtension on double {

  double widthScale(BuildContext context) {
    return toDouble() * MediaQuery.sizeOf(context).width;
  }

  double heightScale(BuildContext context) {
    return toDouble() * MediaQuery.sizeOf(context).height;
  }
  }