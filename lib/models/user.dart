class UserModel {
  final String uid;
  final String name;
  final String univ;
  final String bio;
  final List<String> followers;
  final List<String> following;
  final List<String> post;

  UserModel({
    required this.uid,
    required this.name,
    required this.univ,
    required this.bio,
    required this.followers,
    required this.following,
    required this.post,
  });
}
