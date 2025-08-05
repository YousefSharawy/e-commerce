import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/users/feature/products/data/mappers/product_mapper.dart';
import 'package:e_commerce/feature/users/feature/products/data/source/product_data_source.dart';
import 'package:e_commerce/feature/users/feature/products/domain/entities/products.dart';
import 'package:e_commerce/feature/users/feature/products/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProductRepository)
class ProductImplRepository implements ProductRepository {
  final ProductDataSource productDataSource;

  ProductImplRepository({required this.productDataSource});

  @override
  Future<Either<Failure, List<Products>>> getProducts() async {
    try {
      final response = await productDataSource.getProducts();
      final List<Products> products = response
          .map((productModel) => productModel.toEntity)
          .toList();
      return Right(products);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, Products>> getSpecificProduct(int id) async {
    try {
      final response = await productDataSource.getSpecificProduct(id);
      return Right(response.toEntity);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
