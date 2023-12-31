import 'package:flutter/material.dart';

class LikeBtn extends StatefulWidget {
  final bool isLiked;
  final void Function()? onTap;
  final Color textColor;
  LikeBtn({super.key, required this.isLiked, required this.onTap, required this.textColor});

  @override
  State<LikeBtn> createState() => _LikeBtnState();
}

class _LikeBtnState extends State<LikeBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Icon(
        widget.isLiked ? Icons.favorite : Icons.favorite_border,
        color: widget.isLiked ? Colors.red : widget.textColor,
      ),
    );
  }
}
