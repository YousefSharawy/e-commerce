import 'package:e_commerce/feature/users/feature/cart/data/models/cart_item_model.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/feature/users/feature/products/data/mappers/product_mapper.dart';

extension CartItemMapper on CartItemModel {


  CartItem get toEntity => CartItem(id: id, cartId: cartId, productId: productId, quantity: quantity,product: product?.toEntity);

}