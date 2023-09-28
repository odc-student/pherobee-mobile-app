import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/screens/fake/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../cubits/auth/auth_cubit.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    checkTokenAndNavigate();
    super.initState();

  }

  Future<void> checkTokenAndNavigate() async {
    // Check if token exists
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    String token = prefs.getString('token') ?? '';
    if (token.isNotEmpty) {
      // Navigate to the other screen if token exists
      navigateToHome();
    }
  }
  void navigateToHome() {
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomeScreen(),) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
        child: Column(
          children: [
            const Text('Click sign in '),
            TextButton(
              onPressed: () {
                context.read<AuthCubit>().signIn("louaybadri001@gmail.com", "1234");
              },
              // tooltip: 'Increment',
              child: const Icon(Icons.login),
            ),TextButton(
              onPressed: () {
                context.read<AuthCubit>().signIn("Tunis1", "louay");
              },
              // tooltip: 'Increment',
              child: const Icon(Icons.login),
            ),
          ],
        ),
      ),
    );
  }
}
