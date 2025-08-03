class UserModel {
  final String id;
  final String email;
  final String name;
  final String status;
  final String authorization;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.status,
    required this.authorization,
  });

  factory UserModel.fromSupabase(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      authorization: json['authorization'] ?? 'user', // Default to 'user'
    );
  }

  Map<String, dynamic> toSupabase() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'status': status,
      'authorization': authorization,
    };
  }

  
}