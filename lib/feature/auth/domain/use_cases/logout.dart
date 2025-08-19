import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Logout {
  AuthRepository authRepository;
  
  Logout(this.authRepository);

  Future <Either<Failure,void>> call () => authRepository.logout();
  }