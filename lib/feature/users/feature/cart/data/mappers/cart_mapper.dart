import 'package:e_commerce/feature/users/feature/cart/data/mappers/cart_item_mapper.dart';
import 'package:e_commerce/feature/users/feature/cart/data/models/cart_model.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/entities/cart.dart';

extension CartMapper on CartModel {
  Cart get toEntity => Cart(cartId: cartId, productItems: productItems.map((productModel) => productModel.toEntity).toList(),
    
  );
}
