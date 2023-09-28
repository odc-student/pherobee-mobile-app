import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pherobee/config/colors.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/screens/shared_widgets/input_field_widget.dart';

import '../shared_widgets/button_widget.dart';
import '../shared_widgets/title_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController rewriteNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const TitleWidget(title: "Change Password "),
              SizedBox(
                width: context.width * .8,
                child: Column(
                  children: [
                    InputFieldWidget(
                        isPass: true,
                        controller: currentPasswordController,
                        hint: "Current Password",
                        icon: Icons.password),
                    InputFieldWidget(
                        isPass: true,
                        controller: newPasswordController,
                        hint: "New Password",
                        icon: Icons.password),
                    InputFieldWidget(
                        isPass: true,
                        controller: rewriteNewPasswordController,
                        hint: "Rewrite new Password",
                        icon: Icons.password),
                  ],
                ),
              ),
              ButtonWidget(onTap: (){
                //todo: login logic 
              }, text: 'Change Password',),
              SvgPicture.asset("assets/icons/logo.svg")
            ],
          ),
        ),
      ),
    );
  }
}
