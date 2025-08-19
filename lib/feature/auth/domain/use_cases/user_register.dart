import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserRegister {
  final AuthRepository authRepository;
  UserRegister(this.authRepository);

  Future<Either<Failure, void>> call(
    String email,
    String name,
    String password,
  ) => authRepository.registerAsUser(email, name, password);
}
