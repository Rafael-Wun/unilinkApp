import 'package:flutter/material.dart';
import 'package:unilink_project/views/components/profile/post_grid.dart';

class UserPost extends StatefulWidget {
  const UserPost({super.key});

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  final List<Widget> tabs = const [
    Tab(text: 'Text'),
    Tab(text: 'Photos'),
  ];

  final List<Widget> tabBarViews = const [
    PostGrid(),
    PostGrid(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: tabs,
            dividerColor: Colors.grey[200],
            indicatorColor: Color.fromRGBO(223, 88, 90, 1.0),
          ),
          SizedBox(
            height: 480,
            child: TabBarView(children: tabBarViews),
          ),
        ],
      ),
    );
  }
}
