import 'package:e_commerce/feature/users/feature/products/data/models/products_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts();

  Future<ProductModel> getSpecificProduct(int id);
}
