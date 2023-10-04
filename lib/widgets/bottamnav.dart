import 'package:ff_navigation_bar_plus/ff_navigation_bar_plus.dart';
import 'package:flutter/cupertino.dart';
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
          height: 60,
          child: FFNavigationBar(
            theme: FFNavigationBarTheme(
              barBackgroundColor: Colors.grey.shade100,
              selectedItemBorderColor: Colors.amber,
              selectedItemBackgroundColor: Colors.amber,
              selectedItemIconColor: Colors.black,
              selectedItemLabelColor: Colors.black,
              unselectedItemIconColor: Colors.black.withOpacity(0.8),
              unselectedItemLabelColor: Colors.black.withOpacity(0.7),

            ),
            selectedIndex: _selectedIndex,
            onSelectTab: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [


              FFNavigationBarItem(
                iconData:CupertinoIcons.person_2,
                label: 'Meetings',
              ),
              FFNavigationBarItem(
                iconData: CupertinoIcons.photo,
                label: 'Boards',
              ),FFNavigationBarItem(
                iconData: CupertinoIcons.chat_bubble_text,
                label: 'Chat',
              ),
              FFNavigationBarItem(
                iconData: CupertinoIcons.person,
                label: 'My Suppliers',
              ),
              FFNavigationBarItem(
                iconData:  CupertinoIcons.location_north_line,
                label: 'My Venue',
              ),

            ],
          ),
        ),
      );


  }
}
