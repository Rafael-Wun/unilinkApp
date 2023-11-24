import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String type;
  final String content;
  final String caption;
  final Timestamp? timestamp;
  List<String> likes;

  Post({
    this.id = '',
    this.type = '',
    this.content = '',
    this.caption = '',
    this.timestamp,
    this.likes = const [],
  });
}
