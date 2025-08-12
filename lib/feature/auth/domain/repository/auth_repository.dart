import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, void>> registerAsUser(
    String email,
    String name,
    String password,
  );
  Future<Either<Failure, void>> registerAsVendor(
    String email,
    String name,
    String password,
  );
  Future<Either<Failure, void>> logout(
   
  );
}
