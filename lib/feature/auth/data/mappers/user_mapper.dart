import 'package:e_commerce/feature/auth/data/models/user_model.dart';
import 'package:e_commerce/feature/auth/domain/entities/user_entity.dart';

extension UserMapper on UserModel {
  UserEntity toEntity() => UserEntity(
    name: name,
    email: email,
    status: status,
    authorization: authorization,
  );
}
