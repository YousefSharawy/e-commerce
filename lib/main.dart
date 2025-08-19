import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/routes/route_generator.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/shared/app_theme.dart';
import 'package:e_commerce/core/shared/bloc_observer.dart';
import 'package:e_commerce/feature/admin/representation/cubit/admin_cubit.dart';
import 'package:e_commerce/feature/auth/representation/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/users/feature/cart/representation/cubit/cart_cubit.dart';
import 'package:e_commerce/feature/users/feature/products/representation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Supabase.initialize(
    url: 'https://didwczdonjooxreebyxs.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRpZHdjemRvbmpvb3hyZWVieXhzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQwNjEyNjIsImV4cCI6MjA2OTYzNzI2Mn0.j9JZbr42ZElLm72kjgxdQhxE3crYK3JC1sZ-EubkdkU',
  );
    configureDependancies();

  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt.get<AuthCubit>()),
        BlocProvider(create: (_) => getIt.get<ProductCubit>()),
        BlocProvider(create: (_) => getIt.get<CartCubit>(),),
        BlocProvider(create: (_) => getIt.get<AdminCubit>(),),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: Size(375, 812),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: RouteGenerator.getRoute,
          theme: AppTheme.lightTheme,
        ),
      ),
    );
  }
}
