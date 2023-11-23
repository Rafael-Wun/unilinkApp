import 'package:flutter/material.dart';

class SearchColumn extends StatelessWidget {
  const SearchColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          _search(),
        ],
      ),
    );
  }

  Widget _search() {
    return Container(
      height: 40.0,
      padding: EdgeInsets.only(left: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextFormField(
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          icon: Icon(Icons.search)
        ),
      ),
    );
  }
}