import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class VideosGrid extends StatefulWidget {
  const VideosGrid({super.key});

  @override
  State<VideosGrid> createState() => _VideosGridState();
}

class _VideosGridState extends State<VideosGrid> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: 8,
      padding: EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      itemBuilder: (context, index) => Image.asset(
        'assets/images/barcelona.jpg',
        width: 120,
        height: 120,
        fit: BoxFit.cover,
      ),
    );
  }
}
