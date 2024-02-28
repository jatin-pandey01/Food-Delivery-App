import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/order.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homePage;
  late Order orderPage;
  late Profile profilePage;
  late Wallet walletPage;

  @override
  void initState() {
    homePage = Home();
    orderPage = Order();
    profilePage = Profile();
    walletPage = Wallet();

    pages = [homePage,orderPage,walletPage,profilePage];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(Icons.home_outlined, color: Colors.white,),
          Icon(Icons.shopping_basket_outlined, color: Colors.white,),
          Icon(Icons.wallet_outlined, color: Colors.white,),
          Icon(Icons.person_2_outlined, color: Colors.white,),
        ] ),
        body: pages[currentTabIndex],
    );
  }
}