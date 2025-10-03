import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottonNavBar extends StatefulWidget {
  final Function onTabChange;
  const BottonNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  State<BottonNavBar> createState() =>
      _BottonNavBarState();
}

class _BottonNavBarState
    extends State<BottonNavBar> {
  final List<GButton> tabs = const [
    GButton(icon: Icons.home, text: 'Home'),
    GButton(icon: Icons.add, text: 'addProduct'),
    GButton(
      icon: Icons.favorite,
      text: 'Favorites',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // margin: EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: GNav(
          tabBorderRadius: 15,
          onTabChange: (index) {
            widget.onTabChange(
              index,
            ); // pass index to parent
          },
          tabs: tabs,
          gap: 5,
          backgroundColor: Colors.white,
          color: Colors.grey,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.blueGrey
              .withValues(
                alpha: 25,
              ), // alpha is 0–255
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
