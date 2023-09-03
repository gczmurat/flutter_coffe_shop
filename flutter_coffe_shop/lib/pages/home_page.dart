import 'package:flutter/material.dart';
import 'package:flutter_coffe_shop/components/bottom_nav_bar.dart';
import 'package:flutter_coffe_shop/pages/cart_page.dart';
import 'package:flutter_coffe_shop/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void NavigateBottomNavBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => NavigateBottomNavBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
