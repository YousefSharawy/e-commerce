import 'package:dio/dio.dart';
import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/core/shared/api_constatnt.dart';
import 'package:e_commerce/feature/users/feature/cart/data/models/cart_item_model.dart';
import 'package:e_commerce/feature/users/feature/cart/data/models/cart_model.dart';
import 'package:e_commerce/feature/users/feature/cart/data/source/cart_remote_data_source.dart';
import 'package:e_commerce/feature/users/feature/products/data/models/product_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartApiDataSource implements CartRemoteDataSource {
  final Dio dio;
  final supabase = Supabase.instance.client;

  CartApiDataSource(this.dio);

  @override
  Future<void> addCart() async {
    try {
      final userId = supabase.auth.currentUser!.id;
      final existingCart = await supabase
          .from('carts')
          .select()
          .eq('id', userId);

      if (existingCart.isNotEmpty) {
        return;
      }
      await supabase.from('carts').insert({'id': userId});
    } catch (exception) {
      String? message;
      if (exception is PostgrestException || exception is AuthException) {
        message = (exception as dynamic).message;
      }
      throw RemoteException(message ?? "Failed to create cart");
    }
  }

  @override
  Future<CartModel> getCart() async {
    try {
      final userID = supabase.auth.currentUser!.id;

      final cartResponse = await supabase
          .from('carts')
          .select()
          .eq('id', userID);

      if (cartResponse.isEmpty) {
        return CartModel(cartId: '', productItems: []);
      }

      String cartId = cartResponse.first['id'];

      final response = await supabase
          .from('cart_items')
          .select('id,cart_id,product_id,quantity')
          .eq('cart_id', cartId).order('product_id',ascending: true);

      if (response.isEmpty) {
        return CartModel(cartId: cartId, productItems: []);
      }

      List<CartItemModel> items = [];

      for (int i = 0; i < response.length; i++) {
        var item = response[i];

        CartItemModel cartItem;
        try {
          final productId = item['product_id'];
          final productUrl = "${ApiConstatnt.getProductEndPoint}/$productId";

          final productResponse = await dio.get(productUrl);

          final product = ProductModel.fromJson(productResponse.data);

          cartItem = CartItemModel(
            id: item['id'] as String,
            cartId: item['cart_id'] as String,
            productId: int.parse(item['product_id'].toString()),
            quantity: int.parse(item['quantity'].toString()),
            product: product,
          );
        } catch (productException) {
          if (productException is DioException) {
            throw RemoteException(productException.message ?? "Failed to Display Product");
          }

          cartItem = CartItemModel(
            id: item['id'] as String,
            cartId: item['cart_id'] as String,
            productId: int.parse(item['product_id'].toString()),
            quantity: int.parse(item['quantity'].toString()),
            product: null,
          );
        }
        items.add(cartItem);
      }
      return CartModel(cartId: cartId, productItems: items);
    } catch (exception) {
      String? message;
      if (exception is PostgrestException || exception is AuthException) {
        message = (exception as dynamic).message;
      }
      throw RemoteException(message ?? "Failed to get cart");
    }
  }

  @override
  Future<CartModel> addProduct(int productId, int quantity) async {
    try {
      final userID = supabase.auth.currentUser!.id;

      final cartResponse = await supabase
          .from('carts')
          .select()
          .eq('id', userID);

      String cartId = cartResponse.first['id'];

      final existingItem = await supabase
          .from('cart_items')
          .select('id, quantity')
          .eq('cart_id', cartId)
          .eq('product_id', productId);

      if (existingItem.isNotEmpty) {
        final currentQuantity = existingItem.first['quantity'] as int;
        final newQuantity = currentQuantity + quantity;

        await updateCart(productId, newQuantity);
      } else {
        await supabase.from('cart_items').insert({
          'cart_id': cartId,
          'product_id': productId,
          'quantity': quantity,
        });
      }

      return await getCart();
    } catch (exception) {
      String? message;
      if (exception is PostgrestException || exception is AuthException) {
        message = (exception as dynamic).message;
      }
      throw RemoteException(message ?? "Failed to add product");
    }
  }

  @override
  Future<CartModel> deleteProduct(int productId) async {
    try {
      final userID = supabase.auth.currentUser!.id;

      final cartResponse = await supabase
          .from('carts')
          .select()
          .eq('id', userID);

      final cartId = cartResponse.first['id'];
      await supabase.from('cart_items').delete().match({
        'cart_id': cartId,
        'product_id': productId,
      });

      return await getCart();
    } catch (exception) {
      String? message;
      if (exception is PostgrestException || exception is AuthException) {
        message = (exception as dynamic).message;
      }
      throw RemoteException(message ?? "Failed to delete product");
    }
  }

  @override
  Future<CartModel> updateCart(int productId, int quantity) async {
    try {
      final userID = supabase.auth.currentUser!.id;

      final cartResponse = await supabase
          .from('carts')
          .select()
          .eq('id', userID);

      final cartId = cartResponse.first['id'];
      await supabase.from('cart_items').update({'quantity': quantity}).match({
        'cart_id': cartId,
        'product_id': productId,
      });

      return await getCart();
    } catch (exception) {
      String? message;
      if (exception is PostgrestException || exception is AuthException) {
        message = (exception as dynamic).message;
      }
      throw RemoteException(message ?? "Failed to update cart");
    }
  }
}
