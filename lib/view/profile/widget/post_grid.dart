import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PostGrid extends StatefulWidget {
  const PostGrid({super.key});

  @override
  State<PostGrid> createState() => _PostGridState();
}

class _PostGridState extends State<PostGrid> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      itemBuilder: (context, index) => Image.network(
        'https://images.unsplash.com/photo-1700393289656-9e0a4ff76a2b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8',
        width: 120,
        height: 120,
        fit: BoxFit.cover,
      ),
    );
  }
}
