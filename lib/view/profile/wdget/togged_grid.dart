import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TaggedGrid extends StatefulWidget {
  const TaggedGrid({super.key});

  @override
  State<TaggedGrid> createState() => _TaggedGridState();
}

class _TaggedGridState extends State<TaggedGrid> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: 4,
      padding: EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      itemBuilder: (context, index) => Image.network(
        'https://images.unsplash.com/photo-1505852679233-d9fd70aff56d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTh8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
        width: 120,
        height: 120,
        fit: BoxFit.cover,
      ),
    );
  }
}
