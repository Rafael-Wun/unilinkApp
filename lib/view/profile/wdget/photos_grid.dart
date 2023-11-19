import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotosGrid extends StatefulWidget {
  const PhotosGrid({super.key});

  @override
  State<PhotosGrid> createState() => _PhotosGridState();
}

class _PhotosGridState extends State<PhotosGrid> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: 5,
      padding: EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      itemBuilder: (context, index) => Image.asset(
        'assets/images/bali.jpg',
        width: 120,
        height: 120,
        fit: BoxFit.cover,
      ),
    );
  }
}
