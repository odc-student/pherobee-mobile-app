
import 'package:flutter/material.dart';

extension Config on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height-MediaQuery.of(this).padding.top;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get fullHeight => MediaQuery.of(this).size.height;
  double get small => MediaQuery.of(this).size.height*.01;
  double get medium => MediaQuery.of(this).size.height*.02;
  double get high => MediaQuery.of(this).size.height*.03;
}