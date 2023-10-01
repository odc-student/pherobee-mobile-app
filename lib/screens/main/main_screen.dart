import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pherobee/screens/beehives/beehives_screen.dart';
import 'package:pherobee/screens/subowners/subowners_screen.dart';
import 'package:pherobee/screens/home/home_screen.dart';
import 'package:pherobee/screens/settings/settings_screen.dart';
import 'package:pherobee/screens/shared_widgets/navbar.dart';

import '../../cubits/profile/profile_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ProfileCubit>().loadProfile();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(onTap: _onItemTapped),
      body: [
        const SettingsScreen(),
        const BeehivesScreen(),
        const HomeScreen(),
        const Text("data"),
        const SubownersScreen()
      ][_selectedIndex],
    );
  }
}
