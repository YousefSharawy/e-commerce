import 'package:dio/dio.dart';
import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/core/shared/api_constatnt.dart';
import 'package:e_commerce/feature/users/feature/products/data/models/product_model.dart';
import 'package:e_commerce/feature/users/feature/products/data/source/product_data_source.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProductDataSource)
class ProductApiDataSource implements ProductDataSource {
  final Dio dio;

  ProductApiDataSource({required this.dio});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get(ApiConstatnt.getProductsEndPoint);
      final List<dynamic> productList = response.data;

      return productList.map((e) => ProductModel.fromJson(e)).toList();
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? "Failed to get Products");
    }
  }

  @override
  Future<ProductModel> getSpecificProduct(int id) async {
    try {
      final response = await dio.get("${ApiConstatnt.getProductEndPoint}/$id");
      return ProductModel.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? "Failed to get Products");
    }
  }
}
