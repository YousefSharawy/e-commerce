import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/font_manager.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';
import 'package:e_commerce/feature/users/feature/products/representation/cubit/product_cubit.dart';
import 'package:e_commerce/feature/users/feature/products/representation/cubit/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final int productId = ModalRoute.of(context)?.settings.arguments as int;
      context.read<ProductCubit>().getSpecificProduct(productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        if (state is GetProductLoading) {
          UiUtils.showLoading(context);
        } else if (state is GetProductSuccess) {
          UiUtils.hideLoading(context);
        } else if (state is GetProductError) {
          UiUtils.hideLoading(context);
          UiUtils.showMessage(state.message);
        }
      },
      builder: (context, state) {
        final productCubit = context.read<ProductCubit>();
        final product = productCubit.product;

        return Scaffold(
          backgroundColor: ColorManager.backgroundColor,
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  product?.title ?? "",
                  style: TextStyle(
                    color: ColorManager.black,
                    fontSize: FontSizeManager.s14,
                    fontWeight: FontWeightManager.medium,
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35.h,
                width: double.infinity,
                child: Image.network(product?.image ?? "", fit: BoxFit.contain),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${product?.price ?? 0}\$",
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: FontSizeManager.s32,
                          fontWeight: FontWeightManager.medium,
                        ),
                      ),
                      SizedBox(height: 20.h),
                  
                      Expanded(
                        child: Text(
                          product?.description ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: FontSizeManager.s14,
                            fontWeight: FontWeightManager.medium,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                  
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "${product?.rating.rate ?? 0 }/5⭐",
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: FontSizeManager.s14,
                            fontWeight: FontWeightManager.medium,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                  
                      CustomTextButton(
                        onButtonPressed: () {},
                        label: 'Add to Cart',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
