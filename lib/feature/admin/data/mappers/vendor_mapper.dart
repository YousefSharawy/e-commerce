import 'package:e_commerce/feature/admin/data/models/vendor_model.dart';
import 'package:e_commerce/feature/admin/domain/entities/vendor.dart';

extension VendorMapper on VendorModel {
   Vendor get toEntity => Vendor(
     name: name,
     email: email,
     status: status,
   );
}