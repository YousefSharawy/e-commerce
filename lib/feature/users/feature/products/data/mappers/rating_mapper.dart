import 'package:e_commerce/feature/users/feature/products/data/models/rating_model.dart';
import 'package:e_commerce/feature/users/feature/products/domain/entities/rating.dart';

extension RatingMapper on RatingModel {
  Rating get toEntity => Rating(rate: rate, count: count);
}
