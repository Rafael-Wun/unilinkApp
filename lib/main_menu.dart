import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:unilink_project/view/chat/chat_view.dart';
import 'package:unilink_project/view/explore/explore_view.dart';
import 'package:unilink_project/view/home/home_view.dart';
import 'package:unilink_project/view/profile/profile_view.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screenContainers(),
      items: _navItems(),
      confineInSafeArea: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(8.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12,
    );
  }

  List<Widget> _screenContainers() {
    return [
      HomeView(),
      ExploreView(),
      ChatView(),
      ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          size: 30,
        ),
        title: ("Home"),
        activeColorPrimary: Color.fromRGBO(223, 88, 90, 1.0),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.explore),
        title: ("Explore"),
        activeColorPrimary: Color.fromRGBO(223, 88, 90, 1.0),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.chat_bubble,
          size: 26,
        ),
        title: ("Chat"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person,
          size: 30,
        ),
        title: ("Profile"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
