import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/font_manager.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/feature/users/feature/products/representation/cubit/product_cubit.dart';
import 'package:e_commerce/feature/users/feature/products/representation/cubit/product_states.dart';
import 'package:e_commerce/feature/users/feature/products/representation/screens/custom_product_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<ProductCubit>().getProducts();
    // });
    Future.delayed(
      Duration.zero,
      () => context.read<ProductCubit>().getProducts(),
    );
  }

  List banners = [
    AssetsManager.banner1,
    AssetsManager.banner2,
    AssetsManager.banner3,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        if (state is GetProductsLoading) {
          UiUtils.showLoading(context);
        } else if (state is GetProductsSuccess) {
          UiUtils.hideLoading(context);
        } else if (state is GetProductsError) {
          UiUtils.hideLoading(context);
          UiUtils.showMessage(state.message);
        }
      },
      builder: (context, state) {
        final productCubit = context.read<ProductCubit>();
        final productList = productCubit.products;
        final mensClothesList = productCubit.products
            ?.where((product) => product.category == 'men\'s clothing')
            .toList();
        final womansClothesList = productCubit.products
            ?.where((product) => product.category == 'women\'s clothing')
            .toList();
        final electronicsList = productCubit.products
            ?.where((product) => product.category == 'electronics')
            .toList();
        final jeweleryList = productCubit.products
            ?.where((product) => product.category == 'jewelery')
            .toList();

        return Scaffold(
          backgroundColor: ColorManager.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 500.h,
                  child: CarouselSlider(
                    items: banners.map((banner) {
                      return Container(
                        width: double.infinity,
                        color: ColorManager.gray,
                        child: Image.asset(banner, fit: BoxFit.cover),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 500.h,

                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 8.0.w),
                  child: Text(
                    "Men's clothes",
                    style: TextStyle(
                      fontSize: FontSizeManager.s34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 270.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: mensClothesList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = mensClothesList?[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.productDetailsScreen,
                            arguments: product?.id,
                          );
                        },
                        child: CustomProductContainer(
                          image: product?.image ?? "",
                          price: product?.price ?? 0,
                          title: product?.title ?? "",
                          rate: product?.rating.rate ?? 0,
                        ),
                      ); // Replace with your desired widget
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 8.0.w),
                  child: Text(
                    "Women's clothes",
                    style: TextStyle(
                      fontSize: FontSizeManager.s34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 270.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: womansClothesList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = womansClothesList?[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.productDetailsScreen,
                            arguments: product?.id,
                          );
                        },
                        child: CustomProductContainer(
                          image: product?.image ?? "",
                          price: product?.price ?? 0,
                          title: product?.title ?? "",
                          rate: product?.rating.rate ?? 0,
                        ),
                      ); // Replace with your desired widget
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 8.0.w),
                  child: Text(
                    "Electronics",
                    style: TextStyle(
                      fontSize: FontSizeManager.s34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 270.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: electronicsList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = electronicsList?[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.productDetailsScreen,
                            arguments: product?.id,
                          );
                        },
                        child: CustomProductContainer(
                          image: product?.image ?? "",
                          price: product?.price ?? 0,
                          title: product?.title ?? "",
                          rate: product?.rating.rate ?? 0,
                        ),
                      ); // Replace with your desired widget
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 8.0.w),
                  child: Text(
                    "Jewelry",
                    style: TextStyle(
                      fontSize: FontSizeManager.s34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 270.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: jeweleryList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = jeweleryList?[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.productDetailsScreen,
                            arguments: product?.id,
                          );
                        },
                        child: CustomProductContainer(
                          image: product?.image ?? "",
                          price: product?.price ?? 0,
                          title: product?.title ?? "",
                          rate: product?.rating.rate ?? 0,
                        ),
                      ); // Replace with your desired widget
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
