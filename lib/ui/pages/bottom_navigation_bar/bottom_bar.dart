import 'package:ecommerce/ui/pages/page_view/account/account.dart';
import 'package:ecommerce/ui/pages/page_view/cart/cart.dart';
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
  late PersistentTabController controller;
  //late bool _hideNavBar;
  List<Widget> _buildScreens(PersistentTabController controller) {
    return [
        const HomePageScreen(),
       const Cart(),
       const NotificationPage(),
       const Account()
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home,
          color: controller.index == 0 ? Colors.black87 : Colors.black,
        ),
        title: "Home",
        textStyle: const TextStyle(fontWeight: FontWeight.bold, color:Colors.black ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart,
          color: controller.index == 1 ? Colors.black87 : Colors.black,
        ),
        title: "cart",
        textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.notifications,
          color: controller.index == 2 ? Colors.black87 : Colors.black,
        ),
        title: "notification",
        textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle_rounded,
          color: controller.index == 3 ? Colors.black87 : Colors.black,
        ),
        title: "account",
        textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    ];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PersistentTabController( initialIndex: 0);
   // _hideNavBar = false;
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(controller),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
    //  navBarStyle: NavBarStyle.style7,
    );
  }
}
