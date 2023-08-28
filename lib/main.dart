import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/data/authentication_service.dart';
import 'package:pherobee/data/beekeeper_service.dart';
import 'package:pherobee/repositories/authentication_repository.dart';
import 'package:pherobee/repositories/beekeeper_repository.dart';
import 'package:pherobee/screens/fake/home_screen.dart';
import 'package:pherobee/screens/fake/signin_screen.dart';

import 'cubits/auth/auth_cubit.dart';
import 'cubits/profile/profile_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AuthCubit(
          AuthenticationRepository(AuthenticationService()),
          BeekeeperRepository(BeekeeperService())),
          ),BlocProvider(create: (context) => ProfileCubit(
    BeekeeperRepository(BeekeeperService())))


    ],
      child: const MaterialApp(
          title: "First Page", home: MyHomePage(title: "First Page")),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is LoggedOut) {
          return const SignInScreen();
        } else if (state is AuthInProgress) {
          return const CircularProgressIndicator();
        } else if (state is AuthFailed) {
          return const SignInScreen();
        } else if (state is AuthSuccess) {
          return const HomeScreen();
        } else {
          return const Text("something else");
        }
      },
    );
  }
}
