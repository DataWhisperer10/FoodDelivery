import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/modules/pages/view/home.dart';
import 'package:food_delivery/modules/pages/view/order.dart';
import 'package:food_delivery/modules/pages/view/profile.dart';
import 'package:food_delivery/modules/pages/view/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Profile profile;
  late Order order;
  late Wallet wallet;
  @override
  void initState() {
    homepage = const Home();
    order = const Order();
    profile = const Profile();
    wallet = const Wallet();
    pages = [homepage, order, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 40,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: const Duration(microseconds: 500),
          animationCurve: Curves.bounceInOut,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.wallet_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.person_3_outlined,
              color: Colors.white,
            )
          ]),
      body: pages[currentIndex],
    );
  }
}
