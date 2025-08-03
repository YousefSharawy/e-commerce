// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce/feature/auth/data/repository/auth_impl_repository.dart'
    as _i170;
import 'package:e_commerce/feature/auth/data/sources/auth_remote_data_source.dart'
    as _i277;
import 'package:e_commerce/feature/auth/data/sources/auth_remote_impl_data_source.dart'
    as _i620;
import 'package:e_commerce/feature/auth/domain/repository/auth_repository.dart'
    as _i224;
import 'package:e_commerce/feature/auth/domain/use_cases/login.dart' as _i1012;
import 'package:e_commerce/feature/auth/domain/use_cases/user_register.dart'
    as _i71;
import 'package:e_commerce/feature/auth/domain/use_cases/vendor_register.dart'
    as _i905;
import 'package:e_commerce/feature/auth/representation/cubit/auth_cubit.dart'
    as _i1023;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i277.AuthRemoteDataSource>(
      () => _i620.AuthRemoteImplDataSource(),
    );
    gh.singleton<_i224.AuthRepository>(
      () => _i170.AuthImplRepository(gh<_i277.AuthRemoteDataSource>()),
    );
    gh.singleton<_i905.VendorRegister>(
      () => _i905.VendorRegister(gh<_i224.AuthRepository>()),
    );
    gh.singleton<_i71.UserRegister>(
      () => _i71.UserRegister(gh<_i224.AuthRepository>()),
    );
    gh.singleton<_i1012.Login>(() => _i1012.Login(gh<_i224.AuthRepository>()));
    gh.singleton<_i1023.AuthCubit>(
      () => _i1023.AuthCubit(
        gh<_i1012.Login>(),
        gh<_i71.UserRegister>(),
        gh<_i905.VendorRegister>(),
      ),
    );
    return this;
  }
}
