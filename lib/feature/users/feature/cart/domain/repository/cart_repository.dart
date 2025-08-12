import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, void>> addCart();

  Future<Either<Failure, Cart>> getCart();

  Future<Either<Failure, Cart>> updateCart(
int productId,
    int quantity,
  );

  Future<Either<Failure, Cart>> addProduct(
  int productId,
    int quantity,
  );

  Future<Either<Failure, Cart>> deleteProduct(
    int productId,
  );
}
