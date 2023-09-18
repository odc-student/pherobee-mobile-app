import 'package:flutter/material.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/notifications/widgets/notification_unit.dart';
import 'package:pherobee/screens/notifications/widgets/notification_unit.dart';
import 'package:pherobee/screens/shared_widgets/app_bar_widget.dart';
import 'package:pherobee/screens/shared_widgets/navbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.height * 0.1),
          child: const SafeArea(
              child: AppBarWidget(
            title: "Notifications",
            //todo maybe change the icon
            icon: Icons.notifications,
            // location: 'Location',
          ))),
      bottomNavigationBar: const Navbar(),
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            NotificationUnit(title: "title", body: "Body of the notifications"),
            NotificationUnit(title: "title", body: "Body of the notifications"),
            NotificationUnit(title: "title", body: "Body of the notifications"),
            NotificationUnit(title: "title", body: "Body of the notifications"),
            NotificationUnit(title: "title", body: "Body of the notifications"),
            NotificationUnit(title: "title", body: "Body of the notifications"),
            NotificationUnit(title: "title", body: "Body of the notifications"),
          ],
        ),
      )),
    );
  }
}
