import 'package:e_commerce/feature/admin/domain/entities/vendor.dart';
import 'package:e_commerce/feature/admin/domain/use_cases/approve_vendor.dart';
import 'package:e_commerce/feature/admin/domain/use_cases/deny_vendor.dart';
import 'package:e_commerce/feature/admin/domain/use_cases/get_vendors.dart';
import 'package:e_commerce/feature/admin/representation/cubit/admin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AdminCubit extends Cubit<AdminStates> {
  AdminCubit(this.approveVendor, this.denyVendor, this.getVendors)
    : super(AdminInitialState());
  ApproveVendor approveVendor;
  DenyVendor denyVendor;
  GetVendors getVendors;

  List<Vendor>? vendors = [];

  Future<void> vendorApprovement(String vendorEmail) async {
    emit(AcceptVendorLoading());
    final result = await approveVendor(vendorEmail);
    result.fold((failure) => emit(AcceptVendorError(failure.message)), (_) async{
              await getVendorsList();

      emit(AcceptVendorSucess());
    });
  }

  Future<void> vendorDenial(String vendorEmail) async {
    emit(DenyVendorLoading());
    final result = await denyVendor(vendorEmail);
    result.fold((failure) => emit(DenyVendorError(failure.message)), (_) async {
      await getVendorsList();
      emit(DenyVendorSucess());
    });
  }

  Future<void> getVendorsList() async {
    emit(GetVendorsLoading());
    final result = await getVendors();
    result.fold((failure) => emit(GetVendorsError(failure.message)), (v) {
      emit(GetVendorsSucess());
      vendors = v;
    });
  }
}
