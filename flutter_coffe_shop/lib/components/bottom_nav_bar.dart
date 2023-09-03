import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GNav(
      onTabChange: (value) => onTabChange!(value),
      activeColor: Colors.white,
      gap: 8,
      tabBackgroundColor: Colors.grey.shade500,
      hoverColor: Colors.black,
      tabBorderRadius: 12,
      tabActiveBorder: Border.all(color: Colors.white),
        mainAxisAlignment: MainAxisAlignment.center,
        tabs: [
        GButton(icon: Icons.home,text: "Kahveler",),
        GButton(icon: Icons.shopping_bag_outlined,text: "Sepet",)
      ]),
    );
  }
}