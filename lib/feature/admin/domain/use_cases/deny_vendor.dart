import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/admin/domain/repository/admin_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class DenyVendor {
  final AdminRepository _adminRepository;

  DenyVendor(this._adminRepository);

  Future<Either<Failure, void>> call(String vendorEmail) =>
     _adminRepository.denyVendor(vendorEmail);
  
}
