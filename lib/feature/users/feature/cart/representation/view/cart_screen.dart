import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/font_manager.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/feature/auth/representation/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/users/feature/cart/representation/cubit/cart_cubit.dart';
import 'package:e_commerce/feature/users/feature/cart/representation/cubit/cart_states.dart';
import 'package:e_commerce/feature/users/feature/cart/representation/view/custom_cart_item_contaiener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartCubit>().getUserCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {
        if (state is GetCartLoading) {
          UiUtils.showLoading(context);
        } else if (state is GetCartSuccess) {
          UiUtils.hideLoading(context);
        } else if (state is GetCartError) {
          UiUtils.hideLoading(context);
          UiUtils.showMessage(state.message);
        }
      },
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();
        final cart = cartCubit.cartItem?.productItems ?? [];
        List<num> prices = [];
        for (var item in cart) {
          num price = item.product?.price ?? 0;
          num quantity = item.quantity;
          prices.add(price * quantity);
        }
        num total = 0;
        prices.map((e) {
          total += e;
        }).toList();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.backgroundColor,
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).userLogout();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.loginScreen,
                      (route) => false,
                    );
                  },
                  icon: Icon(Icons.logout_outlined, size: 30),
                ),
              ),
            ],
          ),
          backgroundColor: ColorManager.backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final productItem = cart[index].product;
                    return CustomCartItemContaiener(
                      image: productItem?.image ?? "",
                      price: productItem?.price ?? 0,
                      title: productItem?.title ?? "",
                      quantity: cart[index].quantity,
                      id: cart[index].productId,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Total: $total",
                  style: TextStyle(
                    fontSize: FontSizeManager.s24,
                    fontWeight: FontWeightManager.medium,
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
