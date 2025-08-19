import 'package:e_commerce/feature/users/feature/products/data/models/product_model.dart';

class CartItemModel {
  final String id;
  final String cartId;
  final int productId;
  final int quantity;
  final ProductModel? product;

  const CartItemModel({
    required this.id,
    required this.cartId,
    required this.productId,
    required this.quantity,
    this.product,
  });
 factory CartItemModel.fromSupabase(Map<String, dynamic> json) =>
    CartItemModel(
      id: json['id'] as String,
      cartId: json['cart_id'] as String,
      productId: int.parse(json['product_id'].toString()),
      quantity: int.parse(json['quantity'].toString()),
      product: json['product'] != null
          ? ProductModel.fromSupabase(json['product'] as Map<String, dynamic>)
          : null,
    );
      Map<String, dynamic> toSupabase() => {
    'id': id,
    'cart_id': cartId,
    'product_id': productId,
    'quantity': quantity,
  };

}
