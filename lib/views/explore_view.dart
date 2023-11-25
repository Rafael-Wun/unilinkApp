import 'package:flutter/material.dart';
import 'package:unilink_project/views/components/explore/explore_post.dart';
import 'package:unilink_project/views/widgets/customTextField.dart';
import 'package:unilink_project/views/widgets/story.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBar(),
                Text(
                  'Discover New Friends',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Discover(),
                ExplorePost(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget SearchBar() {
    return Container(
      margin: EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: [
          CustomTextField(
            controller: searchController,
            hintText: 'Search',
            keyboardType: TextInputType.name,
            border: true,
            borderRadius: 50.0,
          )
        ],
      ),
    );
  }

  Widget Discover() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Story(),
            Story(),
            Story(),
            Story(),
            Story(),
            Story(),
            Story(),
            Story(),
          ],
        ),
      ),
    );
  }
}
