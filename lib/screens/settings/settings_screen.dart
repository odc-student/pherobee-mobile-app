import 'package:flutter/material.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/settings/widgets/app_settings_unit.dart';
import 'package:pherobee/screens/shared_widgets/title_widget.dart';
import '../shared_widgets/app_bar_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _isOpened = false;

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
          ),
        ),
      ),
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
                    margin: EdgeInsets.fromLTRB(0, 0, context.medium, 0),
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
                    margin: EdgeInsets.fromLTRB(context.medium, 0, 0, 0),
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
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 2,color: AppColors.primaryColor,strokeAlign: BorderSide.strokeAlignCenter,style: BorderStyle.solid)),
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(30)
                  ,child: ExpansionPanelList(
                    dividerColor: AppColors.primaryColor,
                    // animationDuration: const Duration(milliseconds: 200),
                    // expandIconColor: AppColors.whiteColor,
                    elevation: 1, // Add elevation to create a shadow effect
                    // expandedHeaderPadding: EdgeInsets.all(context.medium),
                    expansionCallback: (i, isOpened) {
                      setState(() {
                        _isOpened = !isOpened;
                      });
                    },
                    children: [
                      ExpansionPanel(
                          // backgroundColor: AppColors.secondaryColor,
                          //   canTapOnHeader: false,
                          body: Container(
                              margin: EdgeInsets.all(context.medium),
                              width: context.width * 0.8,
                              height: context.height * 0.2,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      color: Colors.green,
                                      width: context.width * .3,
                                    ),
                                    Container(
                                      color: Colors.red,
                                      width: context.width * .3,
                                    ),
                                    Container(
                                      color: Colors.green,
                                      width: context.width * .3,
                                    ),
                                    Container(
                                      color: Colors.red,
                                      width: context.width * .3,
                                    ),
                                    Container(
                                      color: Colors.green,
                                      width: context.width * .3,
                                    ),
                                    Container(
                                      color: Colors.red,
                                      width: context.width * .3,
                                    ),
                                    Container(
                                      color: Colors.green,
                                      width: context.width * .3,
                                    ),
                                    Container(
                                      color: Colors.red,
                                      width: context.width * .3,
                                    ),
                                  ],
                                ),
                              )),
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return const Text("Done");
                          },
                          isExpanded: _isOpened),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
