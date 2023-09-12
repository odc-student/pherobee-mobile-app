import 'package:flutter/material.dart';
import 'package:pherobee/config/config.dart';

import '../../config/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTap, required this.text,
  });

  final Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(
          width: context.width * 0.4,
          padding: EdgeInsets.all(context.medium),
          decoration: const BoxDecoration(
            color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Text(
            text,
            style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: context.medium),
            textAlign: TextAlign.center,
          )),
    );
  }
}
