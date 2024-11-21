import 'package:flutter/material.dart';
import 'package:tenniscourt/appConstantes.dart';
import 'package:tenniscourt/screens/Home.dart';
import 'package:tenniscourt/screens/reservas.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  late List<Widget> screens;
  int currentScreen = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    screens = const [
      Home(),
      Reservas()
    ];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: Colors.grey,
        indicatorColor: AppConstants.darkBlue,
        backgroundColor: Colors.white,
        height: 70,
        selectedIndex: currentScreen,
        onDestinationSelected: (index){
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations: const [
          NavigationDestination(selectedIcon: Icon(Icons.home_rounded, color: Colors.white), icon: Icon(Icons.home_outlined), label: 'Inicio',),
          NavigationDestination(selectedIcon: Icon(Icons.calendar_today_rounded, color: Colors.white), icon: Icon(Icons.calendar_today_outlined), label: 'Reservas',),
          NavigationDestination(selectedIcon: Icon(Icons.favorite, color: Colors.white), icon: Icon(Icons.favorite_outline_rounded), label: 'Favoritos',),
        ],
      ),
    );
  }
}
