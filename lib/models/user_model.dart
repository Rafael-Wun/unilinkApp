class UserModel {
  final String uid;
  final String name;
  final String university;
  final String bio;
  final List<String> followers;
  final List<String> following;
  final List<String> post;

  UserModel({
    required this.uid,
    required this.name,
    required this.university,
    required this.bio,
    required this.followers,
    required this.following,
    required this.post,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      university: map['university'] ?? '',
      bio: map['bio'] ?? '',
      followers: (map['followers'] as List<dynamic>?)?.cast<String>() ?? [],
      following: (map['following'] as List<dynamic>?)?.cast<String>() ?? [],
      post: (map['post'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'university': university,
      'bio': bio,
      'followers': followers,
      'following': following,
      'post': post,
    };
  }
}
