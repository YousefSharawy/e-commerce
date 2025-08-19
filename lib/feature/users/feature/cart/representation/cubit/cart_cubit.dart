import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/entities/cart.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/use_cases/add_cart.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/use_cases/add_product.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/use_cases/delete_product.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/use_cases/get_cart.dart';
import 'package:e_commerce/feature/users/feature/cart/domain/use_cases/update_cart.dart';
import 'package:e_commerce/feature/users/feature/cart/representation/cubit/cart_states.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CartCubit extends Cubit<CartStates> {
  final AddCart addCart;
  final GetCart getCart;
  final UpdateCart updateCart;
  final AddProduct addProduct;
  final DeleteProduct deleteProduct;

  CartCubit(
    this.addCart,
    this.getCart,
    this.updateCart,
    this.addProduct,
    this.deleteProduct,
  ) : super(CartInitState());
  Cart? cartItem;
  Future<void> addNewCart() async {
    emit(AddCardLoading());
    final result = await addCart();
    result.fold(
      (failure) => emit(AddCartError(failure.message)),
      (_) => emit(AddCartSuccess()),
    );
  }
  Future<void> getUserCart() async {
    emit(GetCartLoading());
    final result = await getCart();
    result.fold((failure) => emit(GetCartError(failure.message)), (cart) {
      cartItem = cart;
      emit(GetCartSuccess());
    });
  }
  Future<void> updateUserCart(int productId, int quantity) async {
    emit(UpdateCartLoading());
    final result = await updateCart(productId, quantity);
    result.fold((failure) => emit(UpdateCartError(failure.message)), (cart) {
      cartItem = cart;

      emit(UpdateCartSuccess());
    });
  }
  Future<void> addCartItem(int productId, int quantity) async {
    emit(AddProductLoading());
    final result = await addProduct(productId, quantity);
    result.fold(
      (failure) => emit(AddProductError(failure.message)),
      (_) => emit(AddProductSuccess()),
    );
  }
  Future<void> deleteCartItem(int productId) async {
    emit(DeleteProductLoading());
    final result = await deleteProduct(productId);
    result.fold((failure) => emit(DeleteProductError(failure.message)), (cart) {
      cartItem = cart;
      emit(DeleteProductSuccess());
    });
  }
}