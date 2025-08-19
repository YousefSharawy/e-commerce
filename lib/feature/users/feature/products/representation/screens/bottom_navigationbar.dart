import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/feature/users/feature/cart/representation/view/cart_screen.dart';
import 'package:e_commerce/feature/users/feature/products/representation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    void onNavigationBar(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    List<Widget> pages = [HomeScreen(), CartScreen()];
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
        onTap: onNavigationBar,
      ),
    );
  }
}
