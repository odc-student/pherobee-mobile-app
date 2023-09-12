
import 'package:flutter/material.dart';
import 'package:pherobee/config/config.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: context.high),
    );
  }
}
