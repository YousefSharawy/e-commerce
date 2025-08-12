import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/users/feature/cart/data/mappers/cart_mapper.dart';
import 'package:e_commerce/feature/users/feature/cart/data/source/cart_remote_data_source.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/entities/cart.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartImplRepository implements CartRepository {
  final CartRemoteDataSource cartDataSource;
  CartImplRepository(this.cartDataSource);

  @override
  Future<Either<Failure, void>> addCart() async {
    try {
      await cartDataSource.addCart();
      return Right(null);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> getCart() async {
    try {
      final response = await cartDataSource.getCart();
      return Right(response.toEntity);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> updateCart(
    int productId,
    int quantity,
  ) async {
    try {
      final response = await cartDataSource.updateCart(
        productId,
        quantity,
      );
      return Right(response.toEntity);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> addProduct(
    int productId,
    int quantity,
  )  async{
    try {
      final response = await cartDataSource.addProduct(
        productId,
        quantity,
      );
      return Right(response.toEntity);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Cart>> deleteProduct(int productId)  async {
    try {
      final response = await cartDataSource.deleteProduct(
        productId
      );
      return Right(response.toEntity);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
}
}