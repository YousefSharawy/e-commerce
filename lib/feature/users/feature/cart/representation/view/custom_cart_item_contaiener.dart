import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/font_manager.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/feature/users/feature/cart/representation/cubit/cart_cubit.dart';
import 'package:e_commerce/feature/users/feature/cart/representation/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCartItemContainer extends StatelessWidget {
  CustomCartItemContainer({
    required this.price,
    required this.image,
    required this.title,
    this.count = 0,
    this.rate = 0,
    this.id = 0,
    required this.quantity,
    this.description = "",
    super.key,
  });
  final String image;
  final String title;
  final String description;
  final double price;
  final int id;
  final int count;
  final int rate;
  int quantity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: ColorManager.white,
            boxShadow: [
              BoxShadow(
                color: ColorManager.gray.withOpacity(0.5),
                spreadRadius: 2.r,
                blurRadius: 5.r,
                offset: Offset(0, 3),
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          width: 343.w,
          height: 80.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.network(
                      image.isNotEmpty
                          ? image
                          : 'https://via.placeholder.com/75',
                      width: 75.w,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.broken_image, size: 75.w),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: FontSizeManager.s12,
                              fontWeight: FontWeightManager.medium,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text("$price\$"),
                          Expanded(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    quantity++;
                                    BlocProvider.of<CartCubit>(
                                      context,
                                    ).updateUserCart(id, quantity);
                                  },
                                  icon: Icon(Icons.add),
                                ),
                                Text("$quantity"),
                                IconButton(
                                  onPressed: () {
                                    quantity--;
                                    BlocProvider.of<CartCubit>(
                                      context,
                                    ).updateUserCart(id, quantity);

                                    if (quantity <= 0) {
                                      BlocProvider.of<CartCubit>(
                                        context,
                                      ).deleteCartItem(id);
                                      return ; 
                                    }
                                    
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            await BlocProvider.of<CartCubit>(
                              context,
                            ).deleteCartItem(id);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.white,
                          ),
                          child: Icon(
                            Icons.delete_outline_outlined,
                            color: ColorManager.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
