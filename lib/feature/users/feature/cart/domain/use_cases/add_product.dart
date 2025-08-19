import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/entities/cart.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddProduct {
  final CartRepository cartRepository;
  AddProduct(this.cartRepository);

  Future<Either<Failure, Cart>> call( int productId, int quantity) =>
      cartRepository.addProduct( productId, quantity);
}
