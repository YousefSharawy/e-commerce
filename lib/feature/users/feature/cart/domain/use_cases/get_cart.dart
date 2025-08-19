import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/entities/cart.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCart {

  final CartRepository cartRepository;
  GetCart(this.cartRepository);

  Future <Either<Failure,Cart>> call () => cartRepository.getCart();
}