import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/feature/users/feature/products/representation/cubit/product_cubit.dart';
import 'package:e_commerce/feature/users/feature/products/representation/cubit/product_states.dart';
import 'package:e_commerce/feature/users/feature/products/representation/screens/custom_product_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return Scaffold(
          backgroundColor: ColorManager.backgroundColor,
          body: ListView.builder(
            itemCount: productList?.length ?? 0,
            itemBuilder: (context, index) {
              final product = productList?[index];

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
                ),
              ); // Replace with your desired widget
            },
          ),
        );
      },
    );
  }
}
