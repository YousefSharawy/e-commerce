import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/feature/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Login {
  final AuthRepository authRepository;
  Login(this.authRepository);

  Future<Either<Failure, UserEntity>> call(String email, String password) =>
      authRepository.login(email, password);
}
