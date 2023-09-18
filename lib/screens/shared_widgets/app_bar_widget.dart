import 'package:flutter/material.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title, this.location, this.icon});

  final String title;
  final String? location;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.fromLTRB(
          context.medium, context.small, context.medium, context.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(icon!=null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleWidget(title: title),
              Icon(icon,color: AppColors.primaryColor,size: context.high*1.3,)
            ],
          )else if(location!=null)Row(
            children: [
              const Icon(Icons.location_on),
              Text(location!),
            ],
          )else
            TitleWidget(title: title),

        ],
      ),
    );
  }
}
