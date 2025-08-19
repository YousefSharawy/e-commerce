import 'package:e_commerce/feature/users/feature/products/domain/entities/products.dart';
import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
   final String id;
  final String cartId;
  final int productId;
  final int quantity;
  final Products? product;

  const CartItem({
    required this.id,
    required this.cartId,
    required this.productId,
    required this.quantity,
    this.product,
  });
  @override
  List<Object?> get props => [id, cartId];
}