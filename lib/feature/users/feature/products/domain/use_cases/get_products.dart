import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/users/feature/products/domain/entities/products.dart';
import 'package:e_commerce/feature/users/feature/products/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetProducts {
  final ProductRepository productRepository;

  GetProducts({required this.productRepository});

  Future<Either<Failure, List<Products>>> call() =>
      productRepository.getProducts();
}
