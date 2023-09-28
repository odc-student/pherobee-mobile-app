import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/cubits/profile/profile_cubit.dart';
import 'package:pherobee/screens/fake/farms_screen.dart';
import 'package:pherobee/screens/fake/subowners_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../main.dart';
import '../../utils/load_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String role;

  subscribe(String topic) async {
    LocalData localData = LocalData();
    localData.beehiveSerialNumbers.add(topic);
    await FirebaseMessaging.instance.subscribeToTopic(topic);
    print("Subscribe done");
  }

  @override
  void initState() {
    super.initState();
    loadRole();
    context.read<ProfileCubit>().loadProfile();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomInset: false,
        body: Padding(
      padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileNotLoaded) {
            return const Text("Profile not Loaded");
          } else if (state is ProfileLoading) {
            return const CircularProgressIndicator();
          } else if (state is BeekeeperProfileLoaded) {
              final List<String> beehivesSerialNumbers = state.beekeeper!.beehives!.map((e) => e.serialNumber!).toList();

              // beehivesSerialNumbers.map((e) => print(e));
              for (var i = 0; i < beehivesSerialNumbers.length; i++) {
                subscribe(beehivesSerialNumbers[i]);
              }
              return Column(
              children: [
                if (state.beekeeper.lastName != null)
                  Text(state.beekeeper.lastName!),
                const Text("subowners"),
                ...state.beekeeper.subowners!.map((e) => Text(e.email!)),
                Text(state.beekeeper.subowners!.length.toString()),
                const Text("Farms"),
                if (state.beekeeper.farms != null)
                  ...state.beekeeper.farms!.map((e) => Text(e.name!)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubownersScreen(),
                        ),
                      );
                    },
                    child: const Text("Subowners")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FarmsScreen(),
                        ),
                      );
                    },
                    child: const Text("Farms")),
                TextButton(
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(

                          ),
                        ),
                      );
                    },
                    child: const Text("Log OUT"))
              ],
            );
          } else if(state is ProfileError){

            return ErrorToLoad(error: state.error);
          }else if(state is SubownerProfileLoaded){
            return Column(
              children: [
                Text(state.subownerProfile.email!),TextButton(
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                            ),
                        ),
                      );
                    },
                    child: const Text("Log OUT"))

              ],
            );
          }else{
            return const Text("Something else happened");
          }
        },
      ),
    ));
  }

  void loadRole() async {
    final prefs = await SharedPreferences.getInstance();

    String _role = prefs.getString("role")!;
     role = _role;
  }

}

class ErrorToLoad extends StatelessWidget {
  final String error;
  const ErrorToLoad({
    super.key, required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text(error),
          InkWell(
            onTap: (){
              context.read<ProfileCubit>().loadProfile();
            },
            child: const Text("Back"),
          )
        ],
      ),
    );
  }
}
