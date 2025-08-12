

import 'package:e_commerce/feature/users/feature/cart/domain/entities/cart_item.dart';

class Cart {
  final String cartId;
  final List<CartItem> productItems;

  const Cart({required this.cartId, required this.productItems});
}
