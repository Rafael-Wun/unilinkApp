import 'package:flutter/material.dart';
import 'package:unilink_project/view/home/widget/create_post.dart';
import 'package:unilink_project/view/home/widget/single_post.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: Container(
        color: Color.fromRGBO(223, 88, 90, 1.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Color.fromRGBO(240, 240, 240, 1.0),
              child: Column(
                children: [
                  CreatePost(),
                  SinglePost(),
                  SinglePost(),
                  SinglePost(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
