import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:unilink_project/models/user_model.dart';
import 'package:unilink_project/views/chat_view.dart';
import 'package:unilink_project/views/explore_view.dart';
import 'package:unilink_project/views/home_view.dart';
import 'package:unilink_project/views/profile_view.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  UserModel currentUserData = UserModel(
      name: '',
      university: '',
      bio: '',
      followers: [],
      following: [],
      post: []);
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUser.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final getData = snapshot.data!.data() as Map<String, dynamic>;

          currentUserData = UserModel(
            name: getData['name'],
            university: getData['university'],
            bio: getData['bio'],
            followers: List<String>.from(getData['followers'] ?? []),
            following: List<String>.from(getData['following'] ?? []),
            post: List<String>.from(getData['post'] ?? []),
          );
        }

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
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          navBarStyle: NavBarStyle.style12,
        );
      },
    );
  }

  // List yang menampung semua main view
  List<Widget> _screenContainers() {
    return [
      HomeView(
        currentUser: currentUserData,
      ),
      ExploreView(),
      ChatView(),
      ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home,
          size: 30,
        ),
        title: ("Home"),
        activeColorPrimary: const Color.fromRGBO(223, 88, 90, 1.0),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.explore),
        title: ("Explore"),
        activeColorPrimary: const Color.fromRGBO(223, 88, 90, 1.0),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.chat_bubble,
          size: 26,
        ),
        title: ("Chat"),
        activeColorPrimary: const Color.fromRGBO(223, 88, 90, 1.0),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.person,
          size: 30,
        ),
        title: ("Profile"),
        activeColorPrimary: const Color.fromRGBO(223, 88, 90, 1.0),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
