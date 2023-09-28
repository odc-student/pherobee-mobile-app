import 'package:flutter/material.dart';
import 'package:pherobee/screens/beehives/beehives_screen.dart';
import 'package:pherobee/screens/fake/subowners_screen.dart';
import 'package:pherobee/screens/home/home_screen.dart';
import 'package:pherobee/screens/settings/settings_screen.dart';
import 'package:pherobee/screens/shared_widgets/navbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
