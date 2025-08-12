import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddCart {
  final CartRepository cartRepository;
  AddCart(this.cartRepository);

  Future <Either <Failure,void>> call () => cartRepository.addCart();


}