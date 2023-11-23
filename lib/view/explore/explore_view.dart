import 'package:flutter/material.dart';
import 'package:unilink_project/view/explore/widget/discover_new.dart';
import 'package:unilink_project/view/explore/widget/explore_grid.dart';
import 'package:unilink_project/view/explore/widget/explore_post.dart';
import 'package:unilink_project/view/explore/widget/search_column.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchColumn(),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Discover New Friends',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Discover(),
                ExplorePost()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Discover() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            DiscoverNew(),
            DiscoverNew(),
            DiscoverNew(),
            DiscoverNew(),
            DiscoverNew(),
          ],
        ),
      ),
    );
  }
}