class Post {
  final String id;
  final String? content;
  final String caption;
  final List<String> likes;
  final String authorID;

  Post({
    required this.id,
    required this.content,
    required this.caption,
    required this.likes,
    required this.authorID,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] ?? '',
      content: map['content'] ?? '',
      caption: map['caption'] ?? '',
      likes: (map['likes'] as List<dynamic>?)?.cast<String>() ?? [],
      authorID: map['uid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'caption': caption,
      'likes': likes,
      'uid': authorID,
    };
  }
}
