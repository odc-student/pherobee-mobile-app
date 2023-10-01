import 'package:flutter/material.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';

class AppSettingUnit extends StatelessWidget {
  const AppSettingUnit({
    super.key,
    required this.icon,
    required this.title,
    this.onChange,
  });

  final IconData icon;
  final String title;
  final Function(bool)? onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.075,
      margin: EdgeInsets.fromLTRB(0,context.high / 3,0,context.high / 2),
      width: context.width * 0.7,
      decoration: const BoxDecoration(
          color: AppColors.thirdColor,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(

              width: context.width*0.2,
              child: Icon(icon)),
          SizedBox(
            width: onChange != null?context.width*0.3:context.width*0.5,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: context.medium * 0.9, fontWeight: FontWeight.bold),
            ),
          ),
          if (onChange != null) Switch(value: true, onChanged: onChange)
        ],
      ),
    );
  }
}
