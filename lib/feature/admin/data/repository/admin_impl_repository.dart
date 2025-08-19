import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/admin/data/mappers/vendor_mapper.dart';
import 'package:e_commerce/feature/admin/data/source/admin_data_source.dart';
import 'package:e_commerce/feature/admin/domain/entities/vendor.dart';
import 'package:e_commerce/feature/admin/domain/repository/admin_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AdminRepository)
class AdminImplRepository extends AdminRepository {
  final AdminDataSource _adminDataSource;
  AdminImplRepository(this._adminDataSource);
  @override
  Future<Either<Failure, List<Vendor>>> getVendors() async {
    try {
      final response = await _adminDataSource.getVendors();
      return Right(response.map((e) => e.toEntity).toList());
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> approveVendor(String vendorEmail) async {
    try {
      await _adminDataSource.approveVendor(vendorEmail);
      return Right(null);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> denyVendor(String vendorEmail) async {
    try {
      await _adminDataSource.denyVendor(vendorEmail);
      return Right(null);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
