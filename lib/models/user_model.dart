class UserModel {
  final String name;
  final String imageUrl;

  UserModel({
    required this.name,
    required this.imageUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      imageUrl: map['picture']['data']['url'],
    );
  }
}
