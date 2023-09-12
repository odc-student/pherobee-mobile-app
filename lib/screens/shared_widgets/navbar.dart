import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/shared_widgets/nav_item.dart';

import '../../config/colors.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: AppColors.navbarColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
        width: context.width,
        height: context.height * .10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(context.small),
              width: context.width * .4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavItemWidget(
                      title: "Beekeeper",
                      path: "assets/images/beekeeper.png",
                      onTap: () {}),
                  NavItemWidget(
                      title: "Beehives",
                      path: "assets/images/beehives.png",
                      onTap: () {}),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(context.small),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: AppColors.cardColor2),
              child: SvgPicture.asset(
                "assets/icons/logo_simple.svg",
                width: context.width * 0.1125,
                height: context.width * 0.1125,
              ),
            ),
            Container(
              padding: EdgeInsets.all(context.small),
              width: context.width * .4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavItemWidget(
                      title: "Farms",
                      path: "assets/images/farms.png",
                      onTap: () {}),
                  NavItemWidget(
                      title: "Subowners",
                      path: "assets/images/subowner.png",
                      onTap: () {}),
                ],
              ),
            ),
          ],
        ));
  }
}
