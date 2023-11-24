class User {
  final String id;
  String name;
  String email;
  String univ;
  String bio;
  String profile;
  String cover;
  List<String> tags;
  List<String> postID;

  User({
    this.id = '',
    this.name = '',
    this.email = '',
    this.univ = '',
    this.bio = '',
    this.profile = '',
    this.cover = '',
    this.tags = const [],
    this.postID = const [],
  });
}
