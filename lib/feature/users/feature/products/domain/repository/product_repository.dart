import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/users/feature/products/domain/entities/products.dart';

abstract class ProductRepository {

  Future<Either<Failure,List<Products>>> getProducts();

  Future<Either<Failure,Products>> getSpecificProduct(int id);

}