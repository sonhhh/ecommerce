import 'package:ecommerce/ui/pages/page_view/account/account.dart';

import 'package:ecommerce/ui/pages/page_view/home_page/home_page.dart';
import 'package:ecommerce/ui/pages/page_view/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
 // late PersistentTabController _controller;
  //late bool _hideNavBar;
  List<Widget> _buildScreens() {
    return [
      const HomePageScreen(),
      const Card(),
      const NotificationPage(),
      const Account()
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: "cart",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        title: "notification",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle_rounded),
        title: "account",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _controller = PersistentTabController();
   // _hideNavBar = false;
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      //controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
