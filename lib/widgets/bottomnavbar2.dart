class bottomnav2 extends StatefulWidget {
  const bottomnav2({super.key});

  @override
  State<bottomnav2> createState() => _bottomnav2State();
}

class _bottomnav2State extends State<bottomnav2> {
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
