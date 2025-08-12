import 'package:e_commerce/feature/users/feature/cart/data/models/cart_item_model.dart';

class CartModel {
  final String cartId;
  final List<CartItemModel> productItems;

  const CartModel({required this.cartId, required this.productItems});

  factory CartModel.fromSupbase(Map<String, dynamic> json) => CartModel(
    cartId: json['id'] as String,
   productItems: (json['products'] as List<dynamic>?)
        ?.map((e) => CartItemModel.fromSupabase(e as Map<String, dynamic>))
        .toList() ?? [],
  );

  Map<String, dynamic> toSupabase() => {
    'id': cartId,
    'products': productItems.map((e) => e.toSupabase()).toList(),
  };
}
