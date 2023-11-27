import 'package:flutter/material.dart';

class ExploreFriend extends StatefulWidget {
  final String userProfile;
  final String userName;
  final String userBio;

  const ExploreFriend({
    super.key,
    required this.userName,
    required this.userProfile,
    required this.userBio,
  });

  @override
  State<ExploreFriend> createState() => _ExploreFriendState();
}

class _ExploreFriendState extends State<ExploreFriend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 328,
      margin: EdgeInsets.only(bottom: 24.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey[300],
        image: DecorationImage(
          image: NetworkImage(
            widget.userProfile,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, .35)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.userName,
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 16.0),
                    ElevatedButton(onPressed: () {}, child: Text('Follow'))
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.userBio,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
