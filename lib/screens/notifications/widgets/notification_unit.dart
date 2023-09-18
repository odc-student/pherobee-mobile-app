
import 'package:flutter/material.dart';
import 'package:pherobee/config/config.dart';

import '../../../config/colors.dart';

class NotificationUnit extends StatelessWidget {
  const NotificationUnit({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(context.medium),
        margin: EdgeInsets.fromLTRB(0,context.small,0,context.small),
        decoration: const BoxDecoration(
            color: AppColors.redColor,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        height: context.height * 0.125,
        width: context.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Icon(
                  Icons.dangerous,
                  size: context.high * 1.2,
                  color: Colors.white,
                ),
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: context.high * 1.25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(body,style: TextStyle(
                color: Colors.white,
                fontSize: context.medium  ),),
          ],
        ),
      ),
    );
  }
}
