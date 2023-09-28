import 'package:flutter/material.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/shared_widgets/navbar.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';

import '../shared_widgets/app_bar_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.height * 0.1),
          child: const SafeArea(
              child: AppBarWidget(
            title: "Settings",
            icon: Icons.settings,
            // location: 'Location',
          ))),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.fromLTRB(context.medium, 0, context.medium, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: context.width,
                  child: const TitleWidget(title: "Profile")),
              Container(
                margin: EdgeInsets.all(context.medium),
                height: context.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //todo handle cercular images
                    Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(90),
                            ),
                            color: AppColors.thirdColor),
                        child: Icon(
                          Icons.person,
                          size: context.high * 3,
                        )),
                    SizedBox(
                      // color: Colors.red,
                      width: context.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                fontSize: context.medium,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("EMAIL",
                              style: TextStyle(
                                  fontSize: context.medium,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0,0,context.medium,0),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(context.medium),
                            child: Text("My farms",
                                style: TextStyle(
                                    fontSize: context.medium * 0.9,
                                    fontWeight: FontWeight.bold))),
                        Container(

                            padding: EdgeInsets.fromLTRB(context.high,
                                context.medium, context.high, context.medium),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: AppColors.thirdColor),
                            child: Text("My farms",
                                style: TextStyle(
                                    fontSize: context.medium * 0.9,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Container(

                    margin: EdgeInsets.fromLTRB(context.medium,0,0,0),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(context.medium),
                            child: Text("My farms",
                                style: TextStyle(
                                    fontSize: context.medium * 0.9,
                                    fontWeight: FontWeight.bold))),
                        Container(
                          padding: EdgeInsets.fromLTRB(context.high,
                              context.medium, context.high, context.medium),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: AppColors.thirdColor),
                          child: Text("My farms",
                              style: TextStyle(
                                  fontSize: context.medium * 0.9,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      // width: context.width * 0.6,
                      margin: EdgeInsets.all(context.medium),
                      child: Text(
                        "My Beehives",
                        style: TextStyle(
                            fontSize: context.medium * 0.9,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      width: context.width * 0.6,
                      padding: EdgeInsets.fromLTRB(context.high, context.medium,
                          context.high, context.medium),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColors.thirdColor),
                      child: Text(
                        "My Beehives",
                        style: TextStyle(
                            fontSize: context.medium * 0.9,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
              SizedBox(
                  width: context.width,
                  child: const TitleWidget(title: "App Settings")),
              AppSettingUnit(
                icon: Icons.notifications,
                title: 'Mute Notifications',
                onChange: (bool) {},
              ),
              AppSettingUnit(
                icon: Icons.nights_stay_rounded,
                title: 'Dark Theme',
                onChange: (bool) {},
              ),
              SizedBox(
                  width: context.width,
                  child: const TitleWidget(title: "Profile Settings")),
              const AppSettingUnit(
                icon: Icons.key_outlined,
                title: 'Change Password',
              ),
              const AppSettingUnit(
                icon: Icons.logout,
                title: 'Log Out',
              )
            ],
          ),
        ),
      )),
    );
  }
}

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
