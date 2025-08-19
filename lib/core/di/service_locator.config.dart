// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:e_commerce/core/di/api_module.dart' as _i140;
import 'package:e_commerce/feature/admin/data/repository/admin_impl_repository.dart'
    as _i736;
import 'package:e_commerce/feature/admin/data/source/admin_data_source.dart'
    as _i753;
import 'package:e_commerce/feature/admin/data/source/admin_impl_data_source.dart'
    as _i473;
import 'package:e_commerce/feature/admin/domain/repository/admin_repository.dart'
    as _i103;
import 'package:e_commerce/feature/admin/domain/use_cases/approve_vendor.dart'
    as _i37;
import 'package:e_commerce/feature/admin/domain/use_cases/deny_vendor.dart'
    as _i110;
import 'package:e_commerce/feature/admin/domain/use_cases/get_vendors.dart'
    as _i760;
import 'package:e_commerce/feature/admin/representation/cubit/admin_cubit.dart'
    as _i141;
import 'package:e_commerce/feature/auth/data/repository/auth_impl_repository.dart'
    as _i170;
import 'package:e_commerce/feature/auth/data/sources/auth_remote_data_source.dart'
    as _i277;
import 'package:e_commerce/feature/auth/data/sources/auth_remote_impl_data_source.dart'
    as _i620;
import 'package:e_commerce/feature/auth/domain/repository/auth_repository.dart'
    as _i224;
import 'package:e_commerce/feature/auth/domain/use_cases/login.dart' as _i1012;
import 'package:e_commerce/feature/auth/domain/use_cases/logout.dart' as _i423;
import 'package:e_commerce/feature/auth/domain/use_cases/user_register.dart'
    as _i71;
import 'package:e_commerce/feature/auth/domain/use_cases/vendor_register.dart'
    as _i905;
import 'package:e_commerce/feature/auth/representation/cubit/auth_cubit.dart'
    as _i1023;
import 'package:e_commerce/feature/users/feature/cart/data/repository/cart_impl_repository.dart'
    as _i252;
import 'package:e_commerce/feature/users/feature/cart/data/source/cart_api_data_source.dart'
    as _i372;
import 'package:e_commerce/feature/users/feature/cart/data/source/cart_remote_data_source.dart'
    as _i1049;
import 'package:e_commerce/feature/users/feature/cart/domain/repository/cart_repository.dart'
    as _i983;
import 'package:e_commerce/feature/users/feature/cart/domain/use_cases/add_cart.dart'
    as _i146;
import 'package:e_commerce/feature/users/feature/cart/domain/use_cases/add_product.dart'
    as _i1071;
import 'package:e_commerce/feature/users/feature/cart/domain/use_cases/delete_product.dart'
    as _i324;
import 'package:e_commerce/feature/users/feature/cart/domain/use_cases/get_cart.dart'
    as _i574;
import 'package:e_commerce/feature/users/feature/cart/domain/use_cases/update_cart.dart'
    as _i41;
import 'package:e_commerce/feature/users/feature/cart/representation/cubit/cart_cubit.dart'
    as _i670;
import 'package:e_commerce/feature/users/feature/products/data/repository/product_impl_repository.dart'
    as _i299;
import 'package:e_commerce/feature/users/feature/products/data/source/product_api_data_source.dart'
    as _i605;
import 'package:e_commerce/feature/users/feature/products/data/source/product_data_source.dart'
    as _i69;
import 'package:e_commerce/feature/users/feature/products/domain/repository/product_repository.dart'
    as _i100;
import 'package:e_commerce/feature/users/feature/products/domain/use_cases/get_products.dart'
    as _i1029;
import 'package:e_commerce/feature/users/feature/products/domain/use_cases/get_specific_product.dart'
    as _i1028;
import 'package:e_commerce/feature/users/feature/products/representation/cubit/product_cubit.dart'
    as _i652;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiModule = _$ApiModule();
    gh.factory<_i361.Dio>(() => apiModule.dio);
    gh.lazySingleton<_i1049.CartRemoteDataSource>(
        () => _i372.CartApiDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i753.AdminDataSource>(() => _i473.AdminImplDataSource());
    gh.singleton<_i277.AuthRemoteDataSource>(
        () => _i620.AuthRemoteImplDataSource());
    gh.singleton<_i224.AuthRepository>(
        () => _i170.AuthImplRepository(gh<_i277.AuthRemoteDataSource>()));
    gh.singleton<_i905.VendorRegister>(
        () => _i905.VendorRegister(gh<_i224.AuthRepository>()));
    gh.singleton<_i71.UserRegister>(
        () => _i71.UserRegister(gh<_i224.AuthRepository>()));
    gh.singleton<_i1012.Login>(() => _i1012.Login(gh<_i224.AuthRepository>()));
    gh.singleton<_i423.Logout>(() => _i423.Logout(gh<_i224.AuthRepository>()));
    gh.lazySingleton<_i103.AdminRepository>(
        () => _i736.AdminImplRepository(gh<_i753.AdminDataSource>()));
    gh.singleton<_i69.ProductDataSource>(
        () => _i605.ProductApiDataSource(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i983.CartRepository>(
        () => _i252.CartImplRepository(gh<_i1049.CartRemoteDataSource>()));
    gh.lazySingleton<_i110.DenyVendor>(
        () => _i110.DenyVendor(gh<_i103.AdminRepository>()));
    gh.lazySingleton<_i37.ApproveVendor>(
        () => _i37.ApproveVendor(gh<_i103.AdminRepository>()));
    gh.lazySingleton<_i760.GetVendors>(
        () => _i760.GetVendors(gh<_i103.AdminRepository>()));
    gh.singleton<_i1023.AuthCubit>(() => _i1023.AuthCubit(
          gh<_i1012.Login>(),
          gh<_i71.UserRegister>(),
          gh<_i905.VendorRegister>(),
          gh<_i423.Logout>(),
        ));
    gh.lazySingleton<_i141.AdminCubit>(() => _i141.AdminCubit(
          gh<_i37.ApproveVendor>(),
          gh<_i110.DenyVendor>(),
          gh<_i760.GetVendors>(),
        ));
    gh.singleton<_i100.ProductRepository>(() => _i299.ProductImplRepository(
        productDataSource: gh<_i69.ProductDataSource>()));
    gh.singleton<_i1028.GetSpecificProduct>(
        () => _i1028.GetSpecificProduct(gh<_i100.ProductRepository>()));
    gh.singleton<_i1029.GetProducts>(() =>
        _i1029.GetProducts(productRepository: gh<_i100.ProductRepository>()));
    gh.lazySingleton<_i574.GetCart>(
        () => _i574.GetCart(gh<_i983.CartRepository>()));
    gh.lazySingleton<_i146.AddCart>(
        () => _i146.AddCart(gh<_i983.CartRepository>()));
    gh.lazySingleton<_i41.UpdateCart>(
        () => _i41.UpdateCart(gh<_i983.CartRepository>()));
    gh.lazySingleton<_i324.DeleteProduct>(
        () => _i324.DeleteProduct(gh<_i983.CartRepository>()));
    gh.lazySingleton<_i1071.AddProduct>(
        () => _i1071.AddProduct(gh<_i983.CartRepository>()));
    gh.lazySingleton<_i670.CartCubit>(() => _i670.CartCubit(
          gh<_i146.AddCart>(),
          gh<_i574.GetCart>(),
          gh<_i41.UpdateCart>(),
          gh<_i1071.AddProduct>(),
          gh<_i324.DeleteProduct>(),
        ));
    gh.singleton<_i652.ProductCubit>(() => _i652.ProductCubit(
          gh<_i1028.GetSpecificProduct>(),
          gh<_i1029.GetProducts>(),
        ));
    return this;
  }
}

class _$ApiModule extends _i140.ApiModule {}
