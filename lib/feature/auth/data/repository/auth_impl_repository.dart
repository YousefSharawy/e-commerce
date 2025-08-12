import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/auth/data/mappers/user_mapper.dart';
import 'package:e_commerce/feature/auth/data/sources/auth_remote_data_source.dart';
import 'package:e_commerce/feature/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/feature/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthImplRepository implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthImplRepository(this.authRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await authRemoteDataSource.login(email, password);
      return Right(response.toEntity());
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> registerAsUser(
    String email,
    String name,
    String password,
  ) async {
    try {
      await authRemoteDataSource.registerAsUser(email, name, password);
      return Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> registerAsVendor(
    String email,
    String name,
    String password,
  ) async {
    try {
      await authRemoteDataSource.registerAsVendor(email, name, password);
      return Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
  
  @override
  Future<Either<Failure, void>> logout()async {
    try {
      await authRemoteDataSource.logout();
      return Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
      
    }
  }
}
