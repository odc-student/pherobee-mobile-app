import 'package:flutter/material.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title, required this.location});

  final String title;
  final String location;

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
          TitleWidget(title: title),
          Row(
            children: [
              const Icon(Icons.location_on),
              Text(location),
            ],
          ),
        ],
      ),
    );
  }
}
