import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/admin/domain/entities/vendor.dart';

abstract class AdminRepository {
  Future<Either<Failure, List<Vendor>>> getVendors();
  Future<Either<Failure, void>> approveVendor(String vendorEmail);
  Future<Either<Failure, void>> denyVendor(String vendorEmail);
}