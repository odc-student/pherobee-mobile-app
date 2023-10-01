import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/shared_widgets/nav_item.dart';
import 'package:pherobee/screens/subowners/subowners_screen.dart';

import '../../config/colors.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key, required this.onTap,
  });
  final Function(int index) onTap;
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
                      onTap: () {
                        onTap(0);
                      }),
                  NavItemWidget(
                      title: "Beehives",
                      path: "assets/images/beehives.png",
                      onTap: () {onTap(1);}),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                onTap(2);
              },
              child: Container(
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
                      onTap: () {onTap(3);}),
                  NavItemWidget(
                      title: "Subowners",
                      path: "assets/images/subowner.png",
                      onTap: () {
                        onTap(4);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const SubownersScreen(),));
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}
