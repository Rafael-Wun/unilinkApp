import 'package:flutter/material.dart';
import 'package:unilink_project/views/explore/explore_grid.dart';

class ExplorePost extends StatefulWidget {
  const ExplorePost({super.key});

  @override
  State<ExplorePost> createState() => _ExplorePostState();
}

class _ExplorePostState extends State<ExplorePost> {

  final List<Widget> tabs = const [
    Tab(text: 'Explore')
  ];

  final List<Widget> exploreView = const [
    ExploreGrid(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            labelPadding: EdgeInsets.only(left: 12.0),
            tabs: tabs,
            indicatorColor: Colors.white,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            labelColor: Colors.black,
            // dividerColor: Colors.grey[200],
            // indicatorColor: Color.fromRGBO(223, 88, 90, 1.0),
          ),
          SizedBox(
            height: 500,
            child: TabBarView(children: exploreView),
          )
        ],
      ),
    );
  }
}
