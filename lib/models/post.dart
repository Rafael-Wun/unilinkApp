class Post {
  final String? content;
  final String caption;
  final String type;
  final List<String> likes;
  final String userEmail;

  Post({
    required this.content,
    required this.caption,
    required this.type,
    required this.likes,
    required this.userEmail,
  });
}
