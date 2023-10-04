import 'package:ff_navigation_bar_plus/ff_navigation_bar_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_planner/screens/HomePage.dart';
import 'package:wedding_planner/screens/LoginPage.dart';
import 'package:wedding_planner/screens/other%20Pages/ChatListPage.dart';
import 'package:wedding_planner/screens/pages2/quoatelist2.dart';
import 'package:wedding_planner/screens/profilePage.dart';
import 'package:wedding_planner/screens/scrns/viewBudgetPage.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  int  _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
          height: 80.0,
          child: FFNavigationBar(
            theme: FFNavigationBarTheme(
              barBackgroundColor: Colors.grey.shade100,
              selectedItemBorderColor: Colors.pink,
              selectedItemBackgroundColor: Colors.pink,
              selectedItemIconColor: Colors.white,
              selectedItemLabelColor: Colors.pink,
              unselectedItemIconColor: Colors.black.withOpacity(0.7),
              unselectedItemLabelColor: Colors.black.withOpacity(0.7),

            ),
            selectedIndex: _selectedIndex,
            onSelectTab: (index) {
              setState(() {
                _selectedIndex = index;
              });
              _selectedIndex == 0?Get.to(ViewBudget()) :_selectedIndex == 1? Get.to(QuoateList2()):
              _selectedIndex == 2?   Get.to(HomeScreen()): _selectedIndex == 3?Get.to(ChatlistPage()) :
              Get.to(MyProfile());
            },
            items: [

              FFNavigationBarItem(
                iconData: Icons.monetization_on_outlined,
                label: 'Budget',
              ),
              FFNavigationBarItem(
                iconData: Icons.info_outline,
                label: 'All Quotations',
              ),
              FFNavigationBarItem(
                iconData: Icons.home,
                label: 'Home',

              ),
              FFNavigationBarItem(
                iconData: Icons.chat,
                label: 'Chat',
              ),
              FFNavigationBarItem(
                iconData: Icons.person,
                label: 'Profile',
              ),

            ],
          ),
        ),
      );


  }
}
