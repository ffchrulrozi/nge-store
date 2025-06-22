import 'package:flutter/material.dart';
import 'package:nge_store/modules/dashboard/providers/dashboard_provider.dart';
import 'package:nge_store/modules/home/screens/home_screen.dart';
import 'package:nge_store/modules/profile/screens/profile_screen.dart';
import 'package:nge_store/modules/transaction/screens/transaction_screen.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder:
        (BuildContext context, DashboardProvider provider, Widget? child) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 10),
        body: IndexedStack(index: provider.screenIndex, children: [HomeScreen(),TransactionScreen(),ProfileScreen(),],),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.screenIndex,
            onTap: (value) => provider.setScreenIndex(value),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Transaction"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ]),
      );
    });
  }
}
