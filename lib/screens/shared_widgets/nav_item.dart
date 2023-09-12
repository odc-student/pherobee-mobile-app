
import 'package:flutter/material.dart';
import 'package:pherobee/config/config.dart';

class NavItemWidget extends StatelessWidget {
  const NavItemWidget({
    super.key,
    required this.path,
    required this.title, required this.onTap ,
  });

  final String path;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Image.asset(
              path,
              width: context.width * 0.10,
              height: context.width * 0.10,
            ),
          ),
          Text(title)
        ],
      ),
    );
  }
}
