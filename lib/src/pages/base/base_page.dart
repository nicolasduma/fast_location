import 'package:flutter/material.dart';

import 'package:fast_location/src/shared/colors.dart' as app_colors;
import 'package:fast_location/src/pages/base/screens/history/history_screen.dart';
import 'package:fast_location/src/pages/base/screens/home/home_screen.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentScreenIndex = 0;

  final List<Widget> _screens = [HomeScreen(), HistoryScreen()];

  static const List<BottomNavigationBarItem> _navigationButtons = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Histórico'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fast Location"),
        backgroundColor: app_colors.Colors.primary,
        foregroundColor: app_colors.Colors.onPrimary,
      ),

      body: _screens[_currentScreenIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenIndex,
        onTap: (index) => setState(() => _currentScreenIndex = index),
        items: _navigationButtons,
      ),
    );
  }
}
