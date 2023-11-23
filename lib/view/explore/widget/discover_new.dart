import 'package:flutter/material.dart';

class DiscoverNew extends StatefulWidget {
  const DiscoverNew({super.key});

  @override
  State<DiscoverNew> createState() => _DiscoverNewState();
}

class _DiscoverNewState extends State<DiscoverNew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 168,
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey,
      ),
    );
  }
}
