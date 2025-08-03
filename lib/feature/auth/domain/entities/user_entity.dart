class UserEntity {
  String name;
  final String email;
  final String status;
  final String authorization;

  UserEntity({
    required this.email,
    required this.name,
    required this.status,
    required this.authorization,
  });
}
