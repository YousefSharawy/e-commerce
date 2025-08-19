import 'package:e_commerce/feature/admin/data/models/vendor_model.dart';

abstract class AdminDataSource {
  Future<List<VendorModel>> getVendors();
  Future<void> approveVendor(String vendorEmail);
  Future<void> denyVendor(String vendorEmail);

}