import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pherobee/cubits/location/location_cubit.dart';
import 'package:pherobee/data/authentication_service.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';

import 'package:pherobee/data/beekeeper_service.dart';
import 'package:pherobee/data/location_service.dart';
import 'package:pherobee/data/subowner_service.dart';
import 'package:pherobee/repositories/location_repository.dart';
import 'package:pherobee/screens/fake/text.dart';
import 'package:pherobee/screens/main/main_screen.dart';
import 'package:pherobee/repositories/authentication_repository.dart';
import 'package:pherobee/repositories/beekeeper_repository.dart';
import 'package:pherobee/repositories/subowner_repository.dart'; 
import 'package:pherobee/screens/home/home_screen.dart';
import 'package:pherobee/screens/login/login_screen.dart';
import 'package:pherobee/screens/subowners/subowners_screen.dart';
// import 'package:pherobee/screens_v2/screens/home.dart';
import 'cubits/auth/auth_cubit.dart';
import 'cubits/profile/profile_cubit.dart';
import 'firebase_options.dart';

// todo for the UI  still the weather implementation
// todo navbar
// todo subowner vs beekeeper
// todo design for the pop up
// todo design a loading screens
// todo splash screen
// todo first 3 introductive screens
// todo Subowner Screen

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Completer<AndroidMapRenderer?>? initializedRendererCompleter;

  /// Initializes map renderer to the `latest` renderer type for Android platform.
  ///
  /// The renderer must be requested before creating GoogleMap instances,
  /// as the renderer can be initialized only once per application context.
  Future<AndroidMapRenderer?> initializeMapRenderer() async {
    if (initializedRendererCompleter != null) {
      return initializedRendererCompleter!.future;
    }

    final Completer<AndroidMapRenderer?> completer =
    Completer<AndroidMapRenderer?>();
    initializedRendererCompleter = completer;

    WidgetsFlutterBinding.ensureInitialized();

    final GoogleMapsFlutterPlatform mapsImplementation =
        GoogleMapsFlutterPlatform.instance;
    if (mapsImplementation is GoogleMapsFlutterAndroid) {
      unawaited(mapsImplementation
          .initializeWithRenderer(AndroidMapRenderer.latest)
          .then((AndroidMapRenderer initializedRenderer) =>
          completer.complete(initializedRenderer)));
    } else {
      completer.complete(null);
    }

    return completer.future;
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
    initializeMapRenderer();
  }
  await dotenv.load(fileName: ".env");
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
              AuthenticationRepository(AuthenticationService()),
              BeekeeperRepository(BeekeeperService())),
        ),
        BlocProvider(
            create: (context) => ProfileCubit(
                BeekeeperRepository(BeekeeperService()),
                SubownerRepository(SubownerService()))),
        BlocProvider(
            create: (context) => LocationCubit(LocationRepository(LocationService()))),
      ],
      child:  const MaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute: "/",
          // routes: {
          //   "/":(context) =>  const TextScreen(text: "home"),
          //   "/beehives":(context) =>  const TextScreen(text: "beehives"),
          //   "/forgetPassword":(context) =>  const TextScreen(text: "forgetPassword"),
          //   "/auth/reset-password/:id":(context) =>  const TextScreen(text: "/auth/reset-password/"),
          // }
        home: MyHomePage(),

      ),
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
          return const LoginScreen();
        } else if (state is AuthInProgress) {
          return const CircularProgressIndicator();
        } else if (state is AuthFailed) {
          return const LoginScreen();
        } else if (state is AuthSuccess) {
          return const MainScreen();
        } else {
          return const Text("something else");
        }
      },
    );
  }
}
