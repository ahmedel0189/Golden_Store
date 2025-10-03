import 'package:flutter/material.dart';
import 'package:golden_store/helpers/list_of_bottom_nav_bar.dart';
import 'package:golden_store/layers/ui/Widgets/botton_nav_bar.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() =>
      _MainHomePageState();
}

class _MainHomePageState
    extends State<MainHomePage> {
  int selectedIndex = 0;
  navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: BottonNavBar(
        onTabChange: (index) =>
            navigateBottomBar(index),
      ),
      body: ListOfBottomNavBar
          .listOfBottomNavBar[selectedIndex],
    );
  }
}
