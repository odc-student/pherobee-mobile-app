import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pherobee/config/config.dart';

import '../../config/colors.dart';
import '../shared_widgets/button_widget.dart';
import '../shared_widgets/title_widget.dart';
import 'widgets/input_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              const TitleWidget(title: "Log In"),
              SizedBox(
                width: context.width * .8,
                child: Column(
                  children: [
                    InputFieldWidget(
                        isPass: false,
                        controller: mailOrPhoneController,
                        hint: "Email Address or Phone Number",
                        icon: Icons.mail),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputFieldWidget(
                            isPass: true,
                            controller: passwordController,
                            hint: "Password",
                            icon: Icons.password),
                        Text(
                          "Forget Password?",
                          style: TextStyle(
                              fontSize: context.medium,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ButtonWidget(onTap: (){
                //todo: login logic
              }, text: 'Log In',),
              SvgPicture.asset("assets/icons/logo.svg")
            ],
          ),
        ),
      ),
    );
  }
}
