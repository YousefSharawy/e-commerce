import 'package:e_commerce/feature/users/feature/cart/data/models/cart_model.dart';

abstract  class CartRemoteDataSource {

  Future <void> addCart ();
  Future <CartModel> getCart ();
  Future <CartModel> updateCart (int productId,int quantity);
  Future <CartModel> addProduct (int productId,int quantity);
  Future <CartModel> deleteProduct (int productId);

}