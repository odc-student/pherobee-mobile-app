import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/data/authentication_service.dart';
import 'package:pherobee/data/beekeeper_service.dart';
import 'package:pherobee/data/subowner_service.dart';
import 'package:pherobee/repositories/authentication_repository.dart';
import 'package:pherobee/repositories/beekeeper_repository.dart';
import 'package:pherobee/repositories/subowner_repository.dart';
import 'package:pherobee/screens/beehives/beehive_screen.dart';
import 'package:pherobee/screens/fake/signin_screen.dart';
import 'package:pherobee/screens/home/home_screen.dart';
import 'package:pherobee/screens/notifications/notifications_screen.dart';
import 'package:pherobee/screens/settings/settings_screen.dart';
import 'cubits/auth/auth_cubit.dart';
import 'cubits/profile/profile_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );
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
    BeekeeperRepository(BeekeeperService()),SubownerRepository(SubownerService())))],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SettingsScreen()),
    // child: ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


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
          return const HomeScreen( );
        } else {
          return const Text("something else");
        }
      },
    );
  }
}
