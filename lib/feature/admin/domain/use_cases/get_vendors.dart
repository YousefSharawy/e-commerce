import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/admin/domain/entities/vendor.dart';
import 'package:e_commerce/feature/admin/domain/repository/admin_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetVendors {
  final AdminRepository _adminRepository;

  GetVendors(this._adminRepository);

  Future<Either<Failure, List<Vendor>>> call() 
    => _adminRepository.getVendors();
  
}