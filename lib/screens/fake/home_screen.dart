import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/cubits/profile/profile_cubit.dart';
import 'package:pherobee/screens/fake/farms_screen.dart';
import 'package:pherobee/screens/fake/signin_screen.dart';
import 'package:pherobee/screens/fake/subowners_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String data;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().loadProfile();
    // _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileNotLoaded) {
            return const Text("Profile not Loaded");
          } else if (state is ProfileLoading) {
            return const CircularProgressIndicator();
          } else if (state is ProfileLoaded) {
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
                            title: 'Hi',
                          ),
                        ),
                      );
                    },
                    child: const Text("Log OUT"))
              ],
            );
          } else if(state is ProfileError){
            print(state.error);
            return const Text("Profile Error");
          }else{
            return const Text("SOmething else happened");
          }
        },
      ),
    ));
  }
}
