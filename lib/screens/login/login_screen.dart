import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pherobee/config/config.dart';
import 'package:pherobee/cubits/auth/auth_cubit.dart';
import 'package:pherobee/cubits/profile/profile_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/colors.dart';
import '../../utils/valid_mail.dart';
import '../home/home_screen.dart';
import '../shared_widgets/button_widget.dart';
import '../shared_widgets/title_widget.dart';
import '../shared_widgets/input_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkTokenAndNavigate();
  }

  Future<void> checkTokenAndNavigate() async {
    // Check if token exists
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    String token = prefs.getString('token') ?? '';
    print("token");
    print(token);
    if (token.isNotEmpty) {
      // Navigate to the other screen if token exists
      navigateToHome();
    }
  }

  void navigateToHome() {
    context.read<ProfileCubit>().loadProfile();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
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
              ButtonWidget(
                onTap: () {
                  print(isEmailValid(mailOrPhoneController.text));
                  print(passwordController.text);

                  context
                      .read<AuthCubit>()
                      .signIn(mailOrPhoneController.text,passwordController.text);
                  //todo: login logic
                },
                text: 'Log In',
              ),
              SvgPicture.asset("assets/icons/logo.svg")
            ],
          ),
        ),
      ),
    );
  }
}
