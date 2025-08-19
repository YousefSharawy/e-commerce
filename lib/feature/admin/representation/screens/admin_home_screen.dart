import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/font_manager.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/feature/admin/representation/cubit/admin_cubit.dart';
import 'package:e_commerce/feature/admin/representation/cubit/admin_states.dart';
import 'package:e_commerce/feature/admin/representation/screens/custom_vendor_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AdminCubit>().getVendorsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        // Handle loading states
        if (state is GetVendorsLoading ||
            state is AcceptVendorLoading ||
            state is DenyVendorLoading) {
          UiUtils.showLoading(context);
        }
        // Handle success states - SEPARATE CONDITIONS
        else if (state is GetVendorsSucess) {
          UiUtils.hideLoading(context);
          // No message for GetVendorsSucess
        } else if (state is AcceptVendorSucess) {
          UiUtils.hideLoading(context);
          UiUtils.showMessage("Vendor approved successfully");
        } else if (state is DenyVendorSucess) {
          UiUtils.hideLoading(context);
          UiUtils.showMessage("Vendor denied successfully");
        }
        // Handle error states
        else if (state is GetVendorsError ||
            state is AcceptVendorError ||
            state is DenyVendorError) {
          UiUtils.hideLoading(context);
          String message = '';
          if (state is GetVendorsError) {
            message = state.message;
          } else if (state is AcceptVendorError) {
            message = state.message;
          } else if (state is DenyVendorError) {
            message = state.message;
          }
          UiUtils.showMessage(message);
        }
      },
      builder: (context, state) {
        final adminCubit = context.read<AdminCubit>();
        final vendorsList = adminCubit.vendors;

        return Scaffold(
          appBar: AppBar(
            title:  Text('Admin Panel',style: TextStyle(color: ColorManager.primary,fontSize: FontSizeManager.s20,fontWeight: FontWeightManager.semiBold),),
            backgroundColor: ColorManager.backgroundColor,
            centerTitle: true,
            automaticallyImplyLeading: false,

          ),
          backgroundColor: ColorManager.backgroundColor,
          body: vendorsList == null || vendorsList.isEmpty
              ? const Center(child: Text('No vendors found'))
              : ListView.builder(
                  itemCount: vendorsList.length,
                  itemBuilder: (context, index) {
                    final vendor = vendorsList[index];
                    // Remove the unnecessary BlocBuilder
                    return CustomVendorContainer(
                      onApprove: () =>
                          adminCubit.vendorApprovement(vendor.email),
                      onDeny: () => adminCubit.vendorDenial(vendor.email),
                      name: vendor.name,
                      email: vendor.email,
                      status: vendor.status,
                    );
                  },
                ),
        );
      },
    );
  }
}
