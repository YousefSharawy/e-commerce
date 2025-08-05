import 'package:e_commerce/feature/users/feature/products/domain/entities/products.dart';
import 'package:e_commerce/feature/users/feature/products/domain/use_cases/get_products.dart';
import 'package:e_commerce/feature/users/feature/products/domain/use_cases/get_specific_product.dart';
import 'package:e_commerce/feature/users/feature/products/representation/cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(this._getSpecificProduct, this._getProductsUseCase)
    : super(ProductInitState());

  final GetProducts _getProductsUseCase;
  final GetSpecificProduct _getSpecificProduct;

  List<Products>? products;
  Products? product;

  Future<void> getProducts() async {
    emit(GetProductsLoading());

    final result = await _getProductsUseCase();
    result.fold((failure) => emit(GetProductsError(failure.message)), (
      productList,
    ) {
      products = productList;
      emit(GetProductsSuccess());
    });
  }

  Future<void> getSpecificProduct(int id) async {
    emit(GetProductsLoading());
    final result = await _getSpecificProduct(id);
    result.fold(
      (failure) => emit(GetProductError(failure.message)),
      (prdouct)  {
        product =prdouct;
        emit(GetProductSuccess());},
    );
  }
}
