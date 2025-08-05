import 'package:e_commerce/feature/users/feature/products/data/mappers/rating_mapper.dart';
import 'package:e_commerce/feature/users/feature/products/data/models/products_model.dart';
import 'package:e_commerce/feature/users/feature/products/domain/entities/products.dart';

extension ProductMapper on ProductModel {
  Products get toEntity => Products(
    id: id,
    title: title,
    price: price,
    description: description,
    category: category,
    image: image,
    rating: rating.toEntity,
  );
}
