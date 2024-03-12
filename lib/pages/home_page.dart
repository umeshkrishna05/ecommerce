// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bottom.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/orders_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/shoppage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  int selectedIndex = 0;
  void navigateBottom(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> _page = [
    ShopPage(),
    CartPage(),
    OrderPage(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 239, 239),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      bottomNavigationBar: BottomNav(
        OnTabChange: (int index) => navigateBottom(index),
      ),
      body: _page[selectedIndex],
    );
  }
}
